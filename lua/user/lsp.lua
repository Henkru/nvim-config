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

local lspconfig = require('lspconfig')
local set_keymap = require('mappings').lsp

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- Global configuration to share between all the servers
local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  -- Callback function that will be executed when a language server is attached to a buffer
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
  end,
}

-- Set the global configuration
lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util.default_config, lsp_defaults)

-- Diagnostics config
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Change diagnostics symbols
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

--                           --
-- General  Language Servers --
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
local function file_exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local system_name = ''
if vim.fn.has('mac') == 1 then
  system_name = 'macOS'
elseif vim.fn.has('unix') == 1 then
  system_name = 'Linux'
elseif vim.fn.has('win32') == 1 then
  system_name = 'Windows'
end

local sumneko_root_path = os.getenv('HOME') .. '/.local/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/' .. system_name .. '/lua-language-server'

if file_exists(sumneko_binary) then
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  lspconfig.sumneko_lua.setup({
    on_attach = lsp_defaults.on_attach,
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  })
end
