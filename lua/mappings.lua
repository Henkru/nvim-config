local map = vim.api.nvim_set_keymap

local M = {}

M.general = function()
  -- Don't copy the replaced text after pasting in visual mode
  map("v", "p", "\"_dP", {noremap = true})

  -- Use ESC to turn off search highlighting
  map("n", "<Esc>", ":noh <CR>", {silent = true})

  -- Easier navigation between windows
  map("n", "<C-h>", "<C-w>h", {noremap = true})
  map("n", "<C-l>", "<C-w>l", {noremap = true})
  map("n", "<C-k>", "<C-w>k", {noremap = true})
  map("n", "<C-j>", "<C-w>j", {noremap = true})
  map("n", "<C-c>", "<C-w>c", {noremap = true}) -- C-c to close window

  -- Switch between tabs
  map("n", "<TAB>", ":bn <CR>", {silent = true})
  map("n", "<S-TAB>", ":bp <CR>", {silent = true})

  -- Create/Close buffer
  map("n", "<C-n>", ":enew <CR>", {silent = true})
  map("n", "<C-x>", ":bd <CR>", {silent = true})

  -- Indent without leaving visual mode
  map("v", "<", "<gv", {noremap = true})
  map("v", ">", ">gv", {noremap = true})

  -- Terminal related
  map("n", "<Leader>Tt", ":terminal <CR>", {silent = true})
  map("t", "<Esc>", "<C-\\><C-n>", {noremap = true})

  -- Don't replace the clipboard when changing the block
  map('n', 'c', '"_c', {noremap = true})
  map('n', 'C', '"_C', {noremap = true})
  map('n', 'cc', '"_cc', {noremap = true})
  map('x', 'c', '"_c', {noremap = true})
end

M.lsp = function(bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<Leader>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

M.fzf = function()
  map("n", "<Leader>ff", ":lua require('plugins.fzf').fzf() <CR>", {silent = true})
end

M.comment = function()
  map("n", "<Leader>/", ":lua require('plugins.comment').toggle(false) <CR>", {silent = true})
  map("v", "<Leader>/", ":lua require('plugins.comment').toggle(true) <CR>", {silent = true})
end

return M
