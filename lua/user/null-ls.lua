local lspconfig = require('lspconfig')
local function include_if_exists(source)
  local command = source._opts.command
  return vim.fn.executable(command) ~= 0 and source or nil
end

local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    include_if_exists(null_ls.builtins.diagnostics.hadolint),
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.terraform_fmt,
    -- null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.stylish_haskell,
    null_ls.builtins.formatting.verible_verilog_format.with({
      extra_args = {
        '--column_limit',
        '100',
        '--indentation_spaces',
        '2',
        '--over_column_limit_penalty',
        '0',
        '--wrap_spaces',
        '4',
        '--assignment_statement_alignment',
        'align',
        '--case_items_alignment',
        'align',
        '--class_member_variable_alignment',
        'align',
        '--distribution_items_alignment',
        'align',
        '--formal_parameters_alignment',
        'align',
        '--module_net_variable_alignment',
        'align',
        '--named_parameter_alignment',
        'align',
        '--named_port_alignment',
        'align',
        '--port_declarations_alignment',
        'align',
        '--struct_union_members_alignment',
        'align',
      },
    }),
    null_ls.builtins.code_actions.shellcheck,
  },
  on_attach = lspconfig.util.default_config.on_attach,
})
