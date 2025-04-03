local Job = require('plenary.job')

local M = {}

local find_plugins = function(bufnr)
  local language_tree = vim.treesitter.get_parser(bufnr, 'lua')
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()

  local query = vim.treesitter.query.parse(
    'lua',
    [[
      (table_constructor
        . (field value: (string) @plugin_name)
        (field)*
        (field
          name: (identifier) @field_name (#eq? @field_name "commit")
          value: (string) @commit_hash
        )
      )
  ]]
  )

  local result = {}
  for _, captures, _ in query:iter_matches(root, bufnr) do
    local name = vim.treesitter.get_node_text(captures[1][1], bufnr):gsub('[\'"]', '')
    result[name] = captures[3]
  end
  return result
end

local find_plugin_path = function(name)
  local packer_path = vim.fn.stdpath('data') .. '/lazy'
  local splits = vim.split(name, '/')
  local folder_name = splits[#splits]
  local folders = vim.fs.find(folder_name, {
    path = packer_path,
    type = 'directory',
  })
  assert(#folders == 1, 'Multiple matches found for: ' .. name)
  return folders[1]
end

local git_get_remote_branch_name = function(repo_path)
  local out = Job:new({
    command = 'git',
    args = {
      'symbolic-ref',
      'refs/remotes/origin/HEAD',
    },
    cwd = repo_path,
  }):sync()
  local splits = vim.split(out[1], '/')
  return 'origin/' .. splits[#splits]
end

local git_get_hash = function(repo_path, branch)
  local out = Job:new({
    command = 'git',
    args = {
      'rev-parse',
      branch,
    },
    cwd = repo_path,
  }):sync()
  return out[1]
end

local new_commits = function(repo_path)
  local remote_branch = git_get_remote_branch_name(repo_path)
  local out = Job:new({
    command = 'git',
    args = {
      'rev-list',
      '--count',
      'HEAD..' .. remote_branch,
    },
    cwd = repo_path,
  }):sync()
  return tonumber(out[1]) or 0
end

local git_fetch = function(repo_path)
  Job:new({
    command = 'git',
    args = {
      'fetch',
      'origin',
    },
    cwd = repo_path,
  }):sync()
end

local update_plugin = function(bufnr, plugin_name, new_hash)
  local plugins = find_plugins(bufnr)
  local commit_node = plugins[plugin_name]
  assert(commit_node, string.format('Plugin %s not found', plugin_name))

  if new_hash == nil then
    local repo_path = find_plugin_path(plugin_name)
    local remote_branch = git_get_remote_branch_name(repo_path)
    new_hash = git_get_hash(repo_path, remote_branch)
  end

  local start_row, start_col, end_row, end_col = commit_node:range()
  vim.api.nvim_buf_set_text(bufnr, start_row, start_col, end_row, end_col, { "'" .. new_hash .. "'" })
end

local plugins_with_updates = function(bufnr)
  local plugins = find_plugins(bufnr)
  local result = {}
  vim.notify('Fetching updates...', vim.log.levels.INFO)
  for name, _ in pairs(plugins) do
    local repo_path = find_plugin_path(name)
    git_fetch(repo_path)
    local updates = new_commits(repo_path)
    if updates > 0 then
      result[name] = updates
    end
  end
  return result
end

local update_all = function(bufnr)
  local plugins = find_plugins(bufnr)
  for name, _ in pairs(plugins) do
    update_plugin(bufnr, name)
  end
end

M.update_plugin_under_cursor = function(bufnr)
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
  local plugin_name = vim.split(line, ' ')[1]
  update_plugin(bufnr, plugin_name)
  vim.notify(string.format('The commit hash of %s updated', plugin_name), vim.log.levels.INFO)
end

M.create_window_with_updates = function(bufnr)
  local plugins = plugins_with_updates(bufnr)
  local output_bufnr = vim.api.nvim_create_buf(false, true)
  vim.cmd('vsplit')
  vim.api.nvim_win_set_buf(0, output_bufnr)
  for name, count in pairs(plugins) do
    vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, { string.format('%s %i', name, count) })
  end

  vim.api.nvim_buf_set_keymap(
    output_bufnr,
    'n',
    '<leader>g',
    '<cmd>lua require "henkru.update".goto_diff()<cr>',
    { noremap = true }
  )
  vim.api.nvim_buf_set_keymap(
    output_bufnr,
    'n',
    '<leader>u',
    string.format('<cmd>lua require "henkru.update".update_plugin_under_cursor(%i)<cr>', bufnr),
    { noremap = true }
  )
end

M.goto_diff = function()
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
  local plugin_name = vim.split(line, ' ')[1]
  local repo_path = find_plugin_path(plugin_name)
  local remote_branch = git_get_remote_branch_name(repo_path)
  local diff = Job:new({
    command = 'git',
    args = {
      'diff',
      'HEAD..' .. remote_branch,
    },
    cwd = repo_path,
  }):sync()
  local output_bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, diff)
  vim.api.nvim_buf_set_option(output_bufnr, 'filetype', 'gitcommit')
  vim.api.nvim_win_set_buf(0, output_bufnr)
end

vim.api.nvim_create_user_command('UpdatePluginCommits', function()
  local packer_bufnr = vim.api.nvim_get_current_buf()
  M.create_window_with_updates(packer_bufnr)
end, {})

return M
