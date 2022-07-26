local lspconfig = require('lspconfig')
local set_keymap = require('mappings').lsp

require('nvim-lsp-installer').setup({
  automatic_installation = false,
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗',
    },
  },
})

--                           --
--        Diagnostics        --
--                           --
local diagnostic_default = {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  virtual_lines = true,
}

local diagnostic_custom = {
  hls = {
    virtual_text = true,
    update_in_insert = true,
    virtual_lines = false,
  },
}

-- Set default diagnostic config
vim.diagnostic.config(diagnostic_default)

-- Change diagnostics symbols
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

--                           --
--     LSP Configuration     --
--                           --
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- Global configuration to share between all the servers
local lsp_defaults = {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, bufnr)
    -- Keybindings are defined in mappings.lua
    set_keymap(bufnr)
    -- Format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
    -- Set custom diagnostic config
    if diagnostic_custom[client.name] ~= nil then
      local namespace = vim.lsp.diagnostic.get_namespace(client.id)
      local config = vim.tbl_deep_extend('force', diagnostic_default, diagnostic_custom[client.name])
      vim.diagnostic.config(config, namespace)
    end
  end,
}

-- Set the global configuration
lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util.default_config, lsp_defaults)

--                           --
-- General Language Servers  --
--                           --
local servers = {
  ansiblels = {},
  clangd = {},
  dockerls = {},
  hls = {
    settings = {
      haskell = {
        hlintOn = true,
        formattingProvider = 'fourmolu',
      },
    },
  },
  jsonls = {},
  pyright = {},
  terraformls = {},
  tsserver = {},
  yamlls = {
    settings = {
      redhat = {
        telemetry = {
          enabled = false,
        },
      },
    },
  },
}

for lsp, opts in pairs(servers) do
  if lspconfig[lsp] ~= nil then
    lspconfig[lsp].setup(vim.tbl_deep_extend('force', lsp_defaults, opts))
  end
end

--                           --
--   Lua Language Servers    --
--                           --
if vim.fn.executable('lua-language-server') == 1 then
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  lspconfig.sumneko_lua.setup({
    on_attach = lsp_defaults.on_attach,
    capabilities = lsp_defaults.capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })
end
