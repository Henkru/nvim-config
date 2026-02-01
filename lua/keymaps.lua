local M = {}

local function map(mode, lhs, rhs, opts, desc)
  opts = opts or {}
  if desc then
    opts.desc = desc
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

M.general = function()
  map('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true }, 'Clear search highlight')

  map('n', '<C-h>', '<C-w><C-h>', { silent = true }, 'Window: Left')
  map('n', '<C-l>', '<C-w><C-l>', { silent = true }, 'Window: Right')
  map('n', '<C-j>', '<C-w><C-j>', { silent = true }, 'Window: Down')
  map('n', '<C-k>', '<C-w><C-k>', { silent = true }, 'Window: Up')

  map('t', '<Esc><Esc>', '<C-\\><C-n>', { silent = true }, 'Terminal: Exit')
end

return M
