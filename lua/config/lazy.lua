local lazy_commit = '85c7ff3711b730b4030d03144f6db6375044ae82'
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

if not uv.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })

  local current_directory = vim.fn.getcwd()
  vim.cmd(':lcd ' .. lazypath)
  vim.fn.system({ 'git', 'checkout', lazy_commit })
  vim.cmd(':lcd ' .. current_directory)
end

vim.opt.rtp:prepend(lazypath)

local plugins = require('plugins')

table.insert(plugins, {
  'folke/lazy.nvim',
  commit = lazy_commit,
})

local i = 1
while i <= #plugins do
  local plugin = plugins[i]
  if type(plugin) == 'table' then
    if plugin.commit == nil then
      local name = plugin[1] or plugin.name or 'unknown'
      vim.api.nvim_echo({
        {
          string.format(
            "Warning: Plugin '%s' is not pinned to a commit and will not be loaded. Please add the commit hash.",
            name
          ),
          'WarningMsg',
        },
      }, true, {})
      vim.fn.input('Press any key to continue')
      table.remove(plugins, i)
    else
      i = i + 1
    end
  else
    vim.api.nvim_echo({
      { 'Warning: String plugin specs are not allowed with commit enforcement.', 'WarningMsg' },
    }, true, {})
    vim.fn.input('Press any key to continue')
    table.remove(plugins, i)
  end
end

require('lazy').setup(plugins, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
