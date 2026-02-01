return {
  {
    'nvim-treesitter/nvim-treesitter',
    commit = '42fc28ba918343ebfd5565147a42a26580579482',
    build = ':TSUpdate',
    config = function()
      require('config.treesitter')
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    commit = 'a0e182ae21fda68c59d1f36c9ed45600aef50311',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
