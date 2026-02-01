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

M.lsp = function(bufnr)
  local opts = { buffer = bufnr, silent = true }

  map('n', '[d', function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, opts, 'Diagnostic: Prev')
  map('n', ']d', function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, opts, 'Diagnostic: Next')

  map('n', 'gD', vim.lsp.buf.declaration, opts, 'LSP: Declaration')
  map('n', 'gd', vim.lsp.buf.definition, opts, 'LSP: Definition')
  map('n', 'gi', vim.lsp.buf.implementation, opts, 'LSP: Implementation')
  map('n', 'K', vim.lsp.buf.hover, opts, 'LSP: Hover')
  map('n', '<leader>rn', vim.lsp.buf.rename, opts, 'LSP: Rename')
  map('n', '<leader>ca', vim.lsp.buf.code_action, opts, 'LSP: Code Action')
  map('n', '<leader>e', vim.diagnostic.open_float, opts, 'Diagnostic: Float')
  map('n', '<leader>q', vim.diagnostic.setloclist, opts, 'Diagnostic: Loclist')
end

return M
