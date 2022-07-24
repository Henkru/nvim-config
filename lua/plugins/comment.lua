local defaultChar = '// '
local commentChars = {
  python = '# ',
  yaml = '# '
}

local M = {}

M.toggle = function(visual)
  local ftype = vim.bo.filetype
  local commentChar = commentChars[ftype] or defaultChar
  local uncomment = vim.api.nvim_get_current_line():find(commentChar, 1, true)

  if uncomment then
    vim.cmd((visual and "'<,'>" or '') .. 's@^' .. commentChar .. '@')
  else
    vim.cmd((visual and "'<,'>" or '') .. 's@^@' .. commentChar)
  end
  vim.cmd('noh')
end

return M
