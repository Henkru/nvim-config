local M = {}

local lazy_commit = '2a9354c7d2368d78cbd5575a51a2af5bd8a6ad01'

M.bootstrap = function()
  local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      lazypath,
    })

    -- This can be converted to vim.system(..., {cwd = ...}) in v0.10.0
    local current_directory = vim.fn.getcwd()
    vim.cmd(':lcd ' .. lazypath)
    vim.fn.system({
      'git',
      'checkout',
      lazy_commit,
    })
    vim.cmd(':lcd ' .. current_directory)
  end

  vim.opt.rtp:prepend(lazypath)
  return M
end

M.setup = function(plugins, opts)
  -- Track the plugin manager itself
  table.insert(plugins, {
    'folke/lazy.nvim',
    commit = lazy_commit,
  })

  for i, plugin in ipairs(plugins) do
    if plugin.commit == nil then
      vim.api.nvim_echo({
        {
          string.format(
            "Warning: Pluging '%s' is not pinned to the commit and will not be loaded.\nPlease add the commit hash.",
            plugin[1]
          ),
          'WarningMsg',
        },
      }, true, {})
      vim.fn.input('Press any key to continue')
      table.remove(plugins, i)
    end
  end

  require('lazy').setup(plugins, opts)
  return M
end

return M
