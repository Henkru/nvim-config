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

  map("n", "<TAB>", ":BufferLineCycleNext <CR>", {})
  map("n", "<S-TAB>", ":BufferLineCyclePrev <CR>", {})

  -- Close buffer
  map("n", "<C-x>", ":bd <CR>", {silent = true})

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
end

M.nvimtree = function()
  map("n", "<Leader>t", ":NvimTreeToggle <CR>", {silent = true})
end

M.nvimcomment = function()
  map("n", "<Leader>/", ":CommentToggle <CR>", {silent = true})
  map("v", "<Leader>/", ":CommentToggle <CR>", {silent = true})
end

M.telescope = function()
  map("n", "<Leader>ff", ":Telescope find_files <CR>", {noremap = true})
  map("n", "<Leader>fg", ":Telescope live_grep <CR>", {noremap = true})
  map("n", "<Leader>fb", ":Telescope buffers <CR>", {noremap = true})
  map("n", "<Leader>ft", ":Telescope help_tags <CR>", {noremap = true})
end

M.trouble = function()
  map("n", "<Leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
  map("n", "<Leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {silent = true, noremap = true})
  map("n", "<Leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true, noremap = true})
  map("n", "<Leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
  map("n", "<Leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
end

M.neoformat = function()
  map("n", "<Leader>F", ":Neoformat <CR>", {silent = true})
end

M.dashboard = function()
  -- New Buffer
  map("n", "<Leader>fn", ":DashboardNewFile <CR>", {silent = true})
  -- Save session
  map("n", "<Leader>ss", ":SessionSave <CR>", {silent = true})
  -- Load session
  map("n", "<Leader>sl", ":SessionLoad <CR>", {silent = true})
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
  map('n', '<Leader>d<Space>', '<Plug>VimspectorContinue', {silent = true})
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
