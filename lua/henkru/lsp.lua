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
vim.diagnostic.config({
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})

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

local function setup_server(name, opts)
  local config = vim.tbl_deep_extend('force', lsp_defaults, opts or {})
  local ok = pcall(vim.lsp.config, name, config)
  if ok then
    vim.lsp.enable(name)
  end
end

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
  ts_ls = {},
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
  buf_ls = {},
  gopls = {},
  nil_ls = {},
  sourcekit = {},
}

for lsp, opts in pairs(servers) do
  setup_server(lsp, opts)
end

--                           --
--   Lua Language Servers    --
--                           --
if vim.fn.executable('lua-language-server') == 1 then
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  setup_server('lua_ls', {
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
    vim.lsp.config('ltex', config)
    vim.cmd('LspRestart ltex')
    require('henkru.lualine').ltex_cloud = true
  end
end, {})

vim.api.nvim_create_user_command('LspDebug', function()
  vim.lsp.set_log_level('debug')
  require('vim.lsp.log').set_format_func(vim.inspect)
end, {})
