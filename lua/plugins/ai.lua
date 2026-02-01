return {
  {
    'nickjvandyke/opencode.nvim',
    commit = '267b8995e145c34460b529037adf66a04df94237',
    lazy = false,
    config = function()
      require('config.opencode')
      require('keymaps').opencode()
    end,
  },
}
