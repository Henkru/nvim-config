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
    commit = 'f2fa60409630ec2d24acf84494fb55e1d28d593c',
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
    commit = '5bfcc89fd155b4ffc02d18ab3b7d19c2d4e246a7',
    config = function()
      require('config.lsp')
    end,
  },
}
