return {
  {
    'williamboman/mason.nvim',
    commit = '44d1e90e1f66e077268191e3ee9d2ac97cc18e65',
    config = function()
      require('mason').setup({
        PATH = 'append',
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      })
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    commit = 'c953789db7fd28eafe5eb5659846d34b5024b3cc',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'bashls',
          'buf_ls',
          'clangd',
          'dockerls',
          'gopls',
          'jsonls',
          'lua_ls',
          'ltex',
          'nil_ls',
          'pyright',
          'rust_analyzer',
          'sourcekit',
          'sqlls',
          'svlangserver',
          'terraformls',
          'ts_ls',
          'yamlls',
        },
        automatic_installation = false,
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    commit = '3f58aeca0c6ece8a9fb8782ea3fcb6024f285be3',
    config = function()
      require('config.lsp')
    end,
  },
}
