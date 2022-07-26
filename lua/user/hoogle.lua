return {
  list = function()
    local opts = {
      layout_config = {
        horizontal = {
          preview_width = 0.33,
        },
      },
    }
    require('telescope').extensions.hoogle.list(opts)
  end,
}
