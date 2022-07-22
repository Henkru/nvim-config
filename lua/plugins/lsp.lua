local nvim_lsp = require('lspconfig')
local set_keymap = require('mappings').lsp

-- Use an on_attach function to only map the following keys
 -- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  set_keymap(bufnr)
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Change diagnostics symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Configure signature
require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
})

--                           --
-- General  Language Servers --
--                           --
local servers = { 'clangd', 'pyright', 'tsserver', 'dockerls'}
for _, lsp in ipairs(servers) do
    if (nvim_lsp[lsp] ~= nil) then
      nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
      }
  end
end

--                           --
--  Haskel Language Servers  --
--                           --
if (nvim_lsp['hls'] ~= nil) then
  nvim_lsp.hls.setup({
    on_attach = on_attach,
    settings = {
      haskell = {
        hlintOn = true,
        formattingProvider = "fourmolu"
      }
    }
  })
end

--                           --
--   Lua Language Servers    --
--                           --
local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

local system_name = ''
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
end

local sumneko_root_path = os.getenv("HOME")..'/.local/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

if file_exists(sumneko_binary) then
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }
end
