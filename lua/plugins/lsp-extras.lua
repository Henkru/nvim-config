return {
  {
    'folke/trouble.nvim',
    commit = '748ca2789044607f19786b1d837044544c55e80a',
    config = function()
      require('trouble').setup({})
      require('keymaps').trouble()
    end,
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    commit = 'd1b2e6e618c8280c3ab2b01738ff6c9e2278c7be',
    config = function()
      require('lsp_lines').setup()
      require('keymaps').lsp_lines()
    end,
  },
  {
    'ray-x/lsp_signature.nvim',
    commit = 'e92b4e7073345b2a30a56b20db3d541a9aa2771e',
    config = function()
      require('lsp_signature').setup({
        bind = true,
        handler_opts = {
          border = 'rounded',
        },
        hint_enable = false,
        floating_window_above_cur_line = true,
        floating_window_off_x = 8,
        zindex = 50,
      })
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    commit = '3c206dfedf5f1385e9d29f85ffaec7874358592a',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('config.none-ls')
    end,
  },
}
