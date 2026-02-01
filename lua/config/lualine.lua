local lsp_status = {
  'lsp_progress',
  display_components = { 'spinner' },
  timer = { spinner = 500 },
  spinner_symbols = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
}

require('lualine').setup({
  options = {
    theme = 'auto',
    globalstatus = true,
  },
  sections = {
    lualine_x = {
      lsp_status,
      'encoding',
      'fileformat',
      'filetype',
    },
    lualine_z = {
      require('opencode').statusline,
    },
  },
})
