local lspconfig = require('lspconfig')
local set_keymap = require('mappings').lsp

-- Global configuration to share between all the servers
local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  -- Callback function that will be executed when a language server is attached to a buffer
  on_attach = function(client, bufnr)
    -- Keybindings are defined in mappings.lua
    set_keymap(bufnr)
  end
}

-- Set the global configuration
lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)

-- Diagnostics config
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- -- Change diagnostics symbols
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
--
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

--                           --
-- General  Language Servers --
--                           --
local servers = {
  ansiblels = {},
  clangd   = {},
  dockerls = {},
  jsonls   = {},
  pyright  = {},
  terraformls = {},
  tsserver = {},
  yamlls = {
    settings = {
      redhat = {
        telemetry = {
          enabled = false
        }
      }
    }
  }
}

for lsp, opts in pairs(servers) do
    if (lspconfig[lsp] ~= nil) then
      lspconfig[lsp].setup(
        vim.tbl_deep_extend(
          'force',
          lsp_defaults,
          opts
        )
      )
  end
end
