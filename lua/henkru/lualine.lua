local M = {}

M.ltex_cloud = false

M.setup = function()
  local lsp_status = {
    'lsp_progress',
    display_components = { 'spinner' },
    timer = { spinner = 500 },
    spinner_symbols = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
  }
  local codecompanion = require('henkru.lualine-code-companion')

  require('lualine').setup({
    options = {
      theme = 'auto',
      globalstatus = true,
    },
    sections = {
      lualine_x = {
        {
          function()
            return M.ltex_cloud and 'LanguageTool Cloud' or ''
          end,
          color = { fg = '#ff0000', gui = 'bold' },
        },
        codecompanion,
        lsp_status,
        'encoding',
        'fileformat',
        'filetype',
      },
    },
  })
end

return M
