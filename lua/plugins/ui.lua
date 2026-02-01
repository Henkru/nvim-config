return {
  {
    'kyazdani42/nvim-web-devicons',
    commit = '803353450c374192393f5387b6a0176d0972b848',
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    commit = 'beaf41a30c26fd7d6c386d383155cbd65dd554cd',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        background = {
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = false,
        no_italic = false,
        no_bold = false,
      })

      vim.cmd.colorscheme('catppuccin')
    end,
  },
}
