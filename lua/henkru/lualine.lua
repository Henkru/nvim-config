local M = {}

M.ltex_cloud = false

M.setup = function()
  local gpt = require('henkru.chatgpt')

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
        {
          function()
            return M.ltex_cloud and 'LanguageTool Cloud' or ''
          end,
          color = { fg = '#ff0000', gui = 'bold' },
        },
        {
          function()
            if gpt.is_enabled() then
              return '󱚝'
            else
              return ''
            end
          end,
          color = { fg = '#ff0000', gui = 'bold' },
        },
        lsp_status,
        'encoding',
        'fileformat',
        'filetype',
      },
    },
  })
end

return M
