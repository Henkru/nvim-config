local lspconfig = require('lspconfig')
local function include_if_exists(source)
  local command = source._opts.command
  return vim.fn.executable(command) and source or nil
end

local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    include_if_exists(null_ls.builtins.diagnostics.hadolint),
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.markdownlint,
  },
  on_attach = lspconfig.util.default_config.on_attach,
})
