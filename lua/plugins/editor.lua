return {
  {
    'lukas-reineke/indent-blankline.nvim',
    commit = '005b56001b2cb30bfa61b7986bc50657816ba4ba',
    config = function()
      require('ibl').setup()
    end,
  },
  {
    'numtostr/comment.nvim',
    commit = 'e51f2b142d88bb666dcaa77d93a07f4b419aca70',
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'windwp/nvim-autopairs',
    commit = '23320e75953ac82e559c610bec5a90d9c6dfa743',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },
  {
    'junegunn/vim-easy-align',
    commit = 'eee786b558d59554d485a78f70861c9267e0adc2',
    config = function()
      require('keymaps').easy_align()
    end,
  },
}
