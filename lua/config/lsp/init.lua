local keymaps = require('keymaps')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    keymaps.lsp(event.buf)
  end,
})

local defaults = {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
}

-- Use {} for default server config or require(...) for custom settings
local servers = {
  bashls = {},
  buf_ls = {},
  clangd = {},
  dockerls = {},
  gopls = {},
  jsonls = {},
  lua_ls = require('config.lsp.servers.lua_ls'),
  ltex = require('config.lsp.servers.ltex'),
  nil_ls = {},
  pyright = {},
  rust_analyzer = require('config.lsp.servers.rust_analyzer'),
  sourcekit = {},
  sqlls = {},
  svlangserver = {},
  terraformls = {},
  ts_ls = {},
  yamlls = require('config.lsp.servers.yamlls'),
}

for name, opts in pairs(servers) do
  local config = vim.tbl_deep_extend('force', defaults, opts or {})
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end
