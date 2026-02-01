return {
  {
    'nvim-lualine/lualine.nvim',
    commit = '47f91c416daef12db467145e16bed5bbfe00add8',
    config = function()
      require('config.lualine')
    end,
  },
  {
    'arkav/lualine-lsp-progress',
    commit = '56842d097245a08d77912edf5f2a69ba29f275d7',
  },
  {
    'akinsho/bufferline.nvim',
    commit = '655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3',
    config = function()
      require('config.bufferline')
    end,
  },
  {
    'b0o/incline.nvim',
    commit = '8a69dd624dd9eb4c514bad48671131c1dc96fe45',
    config = function()
      require('config.incline')
    end,
  },
}
