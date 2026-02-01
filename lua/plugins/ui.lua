return {
  {
    'kyazdani42/nvim-web-devicons',
    commit = '5b9067899ee6a2538891573500e8fd6ff008440f',
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    commit = 'cb5665990a797b102715188e73c44c3931b3b42e',
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
