local lspconfig = require('lspconfig')
local set_keymap = require('mappings').lsp

require('mason-lspconfig').setup({
  automatic_installation = false,
})

--                           --
--        Diagnostics        --
--                           --
local diagnostic_default = {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  virtual_lines = false,
}

local diagnostic_custom = {}

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

local formatting_disabled = {
  sqlls = true,
}

-- Global configuration to share between all the servers
local lsp_defaults = {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = function(client, bufnr)
    -- Keybindings are defined in mappings.lua
    set_keymap(bufnr) -- Attach keymaps to the current buffer only
    -- Format on save
    if client.server_capabilities.documentFormattingProvider and not formatting_disabled[client.name] then
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
        -- HLS for GHC 9.0.2 does not include stylish-haskell plugin
        -- we'll use null-ls instead
        -- formattingProvider = 'stylish-haskell',
      },
    },
  },
  jsonls = {},
  pyright = {},
  sqlls = {},
  terraformls = {},
  tsserver = {},
  yamlls = {
    settings = {
      yaml = {
        keyOrdering = false,
      },
      redhat = {
        telemetry = {
          enabled = false,
        },
      },
    },
  },
  ltex = {
    settings = {
      ltex = {
        diagnosticSeverity = 'hint',
        additionalRules = {
          enablePickyRules = true,
        },
      },
    },
  },
  svlangserver = {},
  bashls = {},
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        diagnostics = {
          enable = false,
        },
      },
    },
  },
  bufls = {},
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

  lspconfig.lua_ls.setup({
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

-- Restart the LanguageTool LSP with the Premium features (cloud)
vim.api.nvim_create_user_command('LspLtexCloud', function()
  local Job = require('plenary.job')
  local out, return_val = Job:new({
    command = 'op',
    args = { 'read', 'op://Personal/LanguageTool-API/password' },
  }):sync()

  P(out)
  if return_val == 0 then
    local key = out[1]
    local config = vim.tbl_deep_extend('force', lsp_defaults, servers.ltex, {
      settings = {
        ltex = {
          languageToolHttpServerUri = 'https://api.languagetoolplus.com/',
          languageToolOrg = {
            username = 'henri@nurmi.me',
            apiKey = key,
          },
        },
      },
    })
    lspconfig['ltex'].setup(config)
    vim.cmd('LspRestart ltex')
    require('henkru.lualine').ltex_cloud = true
  end
end, {})

vim.api.nvim_create_user_command('LspDebug', function()
  vim.lsp.set_log_level('debug')
  require('vim.lsp.log').set_format_func(vim.inspect)
end, {})
