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
