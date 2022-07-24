local M = {}

local SEP      = " "
local SELECTED = "%#TabLineSel#"
local ITEM     = "%#TabLine#"

local function tabline_render()
  local line = ''
  local currentBuffer = vim.fn.bufnr('%')

  for buffer = 1, vim.fn.bufnr('$') do
    local isListed = vim.fn.buflisted(buffer) == 1
    local isCurrent = buffer == currentBuffer

    if isListed then
      local name = vim.api.nvim_buf_get_name(buffer):match("^.+/(.+)$") or "[No Name]"
      local style = isCurrent and (SEP .. SELECTED) or (ITEM .. SEP)

      line = line .. style .. name
    end
  end

  return line .. ITEM
end

function M.setup()
  _G.tabline_render = tabline_render

  vim.opt.showtabline = 2
  vim.opt.tabline = "%!v:lua.tabline_render()"
end

return M
