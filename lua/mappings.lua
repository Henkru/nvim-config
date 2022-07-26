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

  map("n", "<TAB>", ":BufferLineCycleNext <CR>", {})
  map("n", "<S-TAB>", ":BufferLineCyclePrev <CR>", {})

  -- Create/Close buffer
  map("n", "<C-n>", ":enew <CR>", {silent = true})
  map("n", "<C-x>", ":bd <CR>", {silent = true})
  map("n", "<C-X>", ":bd! <CR>", {silent = true})

  -- Indent without leaving visual mode
  map("v", "<", "<gv", {noremap = true})
  map("v", ">", ">gv", {noremap = true})

  -- Terminal related
  -- map("n", "<Leader>Tt", ":terminal <CR>", {silent = true})
  map("t", "<Esc>", "<C-\\><C-n>", {noremap = true})

  -- Don't replace the clipboard when changing the block
  map('n', 'c', '"_c', {noremap = true})
  map('n', 'C', '"_C', {noremap = true})
  map('n', 'cc', '"_cc', {noremap = true})
  map('x', 'c', '"_c', {noremap = true})

  -- Move between tabs
  map('n', '<Right>', 'gt', {noremap = true})
  map('n', '<Left>', 'gT', {noremap = true})
end

M.lsp = function(bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
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

M.nvimtree = function()
  map("n", "<Leader>t", ":NvimTreeToggle <CR>", {silent = true})
end

M.comment = function()
  map("n", "<Leader>/", "gcc", {})
  map("v", "<Leader>/", "gcc", {})
end

M.telescope = function()
  map("n", "<Leader>ff", ":Telescope find_files <CR>", {noremap = true})
  map("n", "<Leader>fg", ":Telescope live_grep <CR>", {noremap = true})
  map("n", "<Leader>fb", ":Telescope buffers <CR>", {noremap = true})
  map("n", "<Leader>fd", ":Telescope lsp_definitions <CR>", {noremap = true})
  map("n", "<Leader>fi", ":Telescope lsp_implementations <CR>", {noremap = true})
  map("n", "<Leader>ft", ":Telescope help_tags <CR>", {noremap = true})
  map("n", "<Leader>fT", ":Telescope <CR>", {noremap = true})
  map("n", "<Leader>fh", ":lua require 'plugins.hoogle'.list() <CR>", {noremap = true})
  map("n", "<Leader>fr", ":Telescope lsp_references <CR>", {noremap = true})
  map("n", "<Leader>fR", ":Telescope reloader <CR>", {noremap = true})
  map("n", "<Leader>fsd", ":Telescope lsp_document_symbols <CR>", {noremap = true})
  map("n", "<Leader>fsw", ":Telescope lsp_workspace_symbols <CR>", {noremap = true})
end

M.trouble = function()
  map("n", "<Leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
  map("n", "<Leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {silent = true, noremap = true})
  map("n", "<Leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true, noremap = true})
  map("n", "<Leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
  map("n", "<Leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
end

M.vimspector = function()
  -- Start / stop debug session
  map('n', '<Leader>dd', ':call vimspector#Launch() <CR>', {silent = true})
  map('n', '<Leader>ds', ':call vimspector#Reset() <CR>', {silent = true})

  -- Step commands
  map('n', '<Leader>dl', '<Plug>VimspectorStepInto', {silent = true})
  map('n', '<Leader>dj', '<Plug>VimspectorStepOver', {silent = true})
  map('n', '<Leader>dk', '<Plug>VimspectorStepOut', {silent = true})
  map('n', '<Leader>dr', '<Plug>VimspectorRestart', {silent = true})
  map('n', '<Leader>d<Leader>', '<Plug>VimspectorContinue', {silent = true})
  map('n', '<Leader>dc', '<Plug>VimspectorRunToCursor', {silent = true})

  -- Set breakpoints
  map('n', '<Leader>db', '<Plug>VimspectorToggleBreakpoint', {silent = true})
  map('n', '<Leader>dB', '<Plug>VimspectorToggleConditionalBreakpoint', {silent = true})

  -- Switch windows
  map('n', '<Leader>dC', ':call win_gotoid(g:vimspector_session_windows.code) <CR>', {silent = true})
  map('n', '<Leader>dV', ':call win_gotoid(g:vimspector_session_windows.variables) <CR>', {silent = true})
  map('n', '<Leader>dO', ':call win_gotoid(g:vimspector_session_windows.output) <CR>', {silent = true})
end

M.maximizer = function ()
 map('n', '<Leader>m', ':MaximizerToggle <CR>', {silent = true})
end

M.floaterm= function ()
 map('n', '<Leader>T', ':FloatermToggle <CR>', {silent = true})
end

return M
