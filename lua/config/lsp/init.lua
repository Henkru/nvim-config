local keymaps = require('keymaps')
local M = {}

local format_group = vim.api.nvim_create_augroup('LspFormatting', {})
local formatting_disabled = {
  clangd = true,
}

M.on_attach = function(client, bufnr)
  keymaps.lsp(bufnr)

  if client and client.server_capabilities.documentFormattingProvider and not formatting_disabled[client.name] then
    vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = format_group,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

local defaults = {
  capabilities = capabilities,
  on_attach = M.on_attach,
}

-- Use {} for default server config or require(...) for custom settings
local servers = {
  bashls = {},
  buf_ls = {},
  clangd = require('config.lsp.servers.clangd'),
  dockerls = {},
  gopls = {},
  jsonls = {},
  lua_ls = require('config.lsp.servers.lua_ls'),
  ltex = require('config.lsp.servers.ltex'),
  nil_ls = {},
  pyright = {},
  rust_analyzer = require('config.lsp.servers.rust_analyzer'),
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

return M
