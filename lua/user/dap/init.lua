local M = {}

local configure = function()
  -- local dap_breakpoint = {
  --   error = {
  --     text = '🔴',
  --     texthl = 'LspDiagnosticsSignError',
  --     linehl = '',
  --     numhl = '',
  --   },
  --   rejected = {
  --     text = '',
  --     texthl = 'LspDiagnosticsSignHint',
  --     linehl = '',
  --     numhl = '',
  --   },
  --   stopped = {
  --     text = '🟡',
  --     texthl = 'LspDiagnosticsSignInformation',
  --     linehl = 'DiagnosticUnderlineInfo',
  --     numhl = 'LspDiagnosticsSignInformation',
  --   },
  -- }
  --
  -- vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
  -- vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
  -- vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
end

local configure_exts = function()
  require('nvim-dap-virtual-text').setup({
    commented = true,
  })

  local dap, dapui = require('dap'), require('dapui')
  dapui.setup({})
  dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
  end
end

local configure_debuggers = function() end

M.setup = function()
  configure()
  configure_exts()
  configure_debuggers()
  require('mappings').debug()

  local group = vim.api.nvim_create_augroup('DapDebuggers', { clear = true })
  vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = 'python',
    command = ':lua require"user.dap.python"',
  })
end

return M
