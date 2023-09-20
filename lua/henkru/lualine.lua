local grammarly = require('henkru.grammarly')
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
      { grammarly.status_line, color = { fg = '#ff0000', gui = 'bold' } },
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
