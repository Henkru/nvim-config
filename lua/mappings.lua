local map = function(mode, lhs, rhs, opts, desc)
  if desc then
    opts['desc'] = desc
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

local noremap = { noremap = true }
local silent = { silent = true }
local silent_noremap = { silent = true, noremap = true }

local M = {}

M.general = function()
  -- Don't copy the replaced text after pasting in visual mode
  map('v', 'p', '"_dP', noremap)

  -- Use ESC to turn off search highlighting
  map('n', '<Esc>', ':noh <CR>', silent)

  -- Easier navigation between windows
  map('n', '<C-h>', '<C-w>h', noremap, 'Window: Left')
  map('n', '<C-l>', '<C-w>l', noremap, 'Window: Right')
  map('n', '<C-k>', '<C-w>k', noremap, 'Window: Up')
  map('n', '<C-j>', '<C-w>j', noremap, 'Window: Down')
  map('n', '<C-c>', '<C-w>c', noremap, 'Window: Close') -- C-c to close window

  map('n', '<TAB>', ':BufferLineCycleNext <CR>', {}, 'Buffer: Next')
  map('n', '<S-TAB>', ':BufferLineCyclePrev <CR>', {}, 'Buffer: Previous')

  -- Create/Close buffer
  map('n', '<C-n>', ':enew <CR>', silent, 'Buffer: New')
  map('n', '<C-x>', ':bd <CR>', silent, 'Buffer: Close')
  map('n', '<C-X>', ':bd! <CR>', silent, 'Buffer: Close!')

  -- Indent without leaving visual mode
  map('v', '<', '<gv', noremap)
  map('v', '>', '>gv', noremap)

  -- Terminal related
  map('t', '<Esc>', '<C-\\><C-n>', noremap)

  -- Don't replace the clipboard when changing the block
  map('n', 'c', '"_c', noremap)
  map('n', 'C', '"_C', noremap)
  map('n', 'cc', '"_cc', noremap)
  map('x', 'c', '"_c', noremap)

  -- Move between tabs
  map('n', '<Right>', 'gt', noremap, 'Tab: Next')
  map('n', '<Left>', 'gT', noremap, 'Tab: Previous')

  -- Move lines
  map('n', '<Leader>k', ':m .-2<CR>==', noremap, 'Move line: Up')
  map('n', '<Leader>j', ':m .+1<CR>==', noremap, 'Move line: Down')
  map('v', '<Leader>k', ":m '<-2<CR>gv=gv", noremap, 'Move selection: Up')
  map('v', '<Leader>j', ":m '>+1<CR>gv=gv", noremap, 'Move selection: Down')
end

M.lsp = function(bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  local ts = require('telescope.builtin')

  map('n', '[d', function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, opts, 'Diagnostic: Go Previous')
  map('n', ']d', function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, opts, 'Diagnostic: Go Next')

  map('n', 'gD', vim.lsp.buf.declaration, opts, 'LSP: Go Declaration')
  map('n', 'gd', ts.lsp_definitions, opts, 'LSP: Go Definition')
  map('n', 'gi', vim.lsp.buf.implementation, opts, 'LSP: Go Implementation')
  map('n', '<Leader>D', vim.lsp.buf.type_definition, opts, 'LSP: Go Type Definition')

  map('n', 'gr', ts.lsp_references, opts, 'LSP: List References')
  map('n', 'K', vim.lsp.buf.hover, opts, 'LSP: Show Hover Information')
  map('n', '<Leader>hs', vim.lsp.buf.signature_help, opts, 'LSP: Show Signature')

  map('n', '<Leader>hd', require('lsp_lines').toggle, opts, 'LSP: Toggle Lines')
  map('n', '<Leader>e', vim.diagnostic.open_float, opts, 'Diagnostic: Show Error messages')
  map('n', '<Leader>q', vim.diagnostic.setloclist, opts, 'Diagnostic: Open Quickfix list')

  map('n', '<Leader>rn', vim.lsp.buf.rename, opts, 'LSP: Rename')
  map('n', '<Leader>ca', vim.lsp.buf.code_action, opts, 'LSP: Code Action')
  map('n', '<Leader>F', function()
    vim.lsp.buf.format({ async = true })
  end, opts, 'LSP: Format Code')
end

M.lsp_global = function()
  map('n', '<Leader>G', ':LspLtexCloud<CR>', silent, 'LanguageTool: Enable Cloud')
end

M.dap = function(helpers)
  local dap = require('dap')
  local dapui = require('dapui')
  local launch_current = helpers and helpers.launch_current or dap.continue

  map('n', '<F5>', launch_current, silent_noremap, 'DAP: Continue')
  map('n', '<F10>', dap.step_over, silent_noremap, 'DAP: Step Over')
  map('n', '<F11>', dap.step_into, silent_noremap, 'DAP: Step Into')
  map('n', '<F12>', dap.step_out, silent_noremap, 'DAP: Step Out')

  map('n', '<Leader>b', dap.toggle_breakpoint, silent_noremap, 'DAP: Toggle Breakpoint')
  map('n', '<Leader>B', function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
  end, silent_noremap, 'DAP: Conditional Breakpoint')

  map('n', '<Leader>dr', dap.repl.open, silent_noremap, 'DAP: Open REPL')
  map('n', '<Leader>du', dapui.toggle, silent_noremap, 'DAP: Toggle UI')
end

M.nvimtree = function()
  map('n', '<Leader>t', ':NvimTreeToggle<CR>', silent, 'File Explorer: Toggle')
end

M.telescope = function()
  local builtin = require('telescope.builtin')
  map('n', '<Leader>ff', builtin.find_files, noremap, 'Telescope: Find Files')
  map('n', '<Leader>fg', builtin.live_grep, noremap, 'Telescope: Live Grep')
  map('n', '<Leader>fb', builtin.buffers, noremap, 'Telescope: Buffers')
  map('n', '<Leader>fd', builtin.lsp_definitions, noremap, 'Telescope: LSP Definitions')
  map('n', '<Leader>fi', builtin.lsp_implementations, noremap, 'Telescope: LSP Implementations')
  map('n', '<Leader>fn', function()
    builtin.find_files({ cwd = '~/.config/nvim' })
  end, noremap, 'Telescope: Neovim Config')
  map('n', '<Leader>ft', builtin.help_tags, noremap, 'Telescope: Help Tags')
  map('n', '<Leader>fT', ':Telescope <CR>', noremap, 'Telescope: Pickers')
  map('n', '<Leader>fh', function()
    require('henkru.hoogle').list()
  end, noremap, 'Telescope: Hoogle')
  map('n', '<Leader>fr', builtin.lsp_references, noremap, 'Telescope: LSP References')
  map('n', '<Leader>fR', builtin.reloader, noremap, 'Telescope: Reloader')
  map('n', '<Leader>fsd', builtin.lsp_document_symbols, noremap, 'Telescope: LSP Document Symbols')
  map('n', '<Leader>fsw', builtin.lsp_workspace_symbols, noremap, 'Telescope: LSP Workspace Symbols')
  map('n', '<Leader>/', builtin.current_buffer_fuzzy_find, noremap, 'Telescope: Current Buffer')
  map('n', '<Leader>fk', builtin.keymaps, noremap, 'Telescope: Key Maps')
end

M.trouble = function()
  map('n', '<Leader>xx', '<cmd>Trouble<CR>', silent_noremap, 'Diagnostic: Toggle')
  map('n', '<Leader>xw', '<cmd>Trouble lsp_workspace_diagnostics<CR>', silent_noremap, 'Diagnostic: LSP Workspace')
  map('n', '<Leader>xd', '<cmd>Trouble lsp_document_diagnostics<CR>', silent_noremap, 'Diagnostic: LSP Document')
  map('n', '<Leader>xl', '<cmd>Trouble loclist<CR>', silent_noremap, 'Diagnostic: Location List')
  map('n', '<Leader>xq', '<cmd>Trouble quickfix<CR>', silent_noremap, 'Diagnostic: Quickfix')
end

M.cmp = function()
  local cmp = require('cmp')
  local luasnip = require('luasnip')

  return cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),

    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-y>'] = cmp.mapping.confirm({ select = true }),

    ['<C-l>'] = cmp.mapping(function()
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { 'i', 's' }),
    ['<C-h>'] = cmp.mapping(function()
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { 'i', 's' }),
  })
end

M.treesitter = function()
  local ok, ts_repeat_move = pcall(require, 'nvim-treesitter-textobjects.repeatable_move')
  if not ok then
    return
  end
  vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next, { desc = 'Repeat last move' })
  vim.keymap.set(
    { 'n', 'x', 'o' },
    ',',
    ts_repeat_move.repeat_last_move_previous,
    { desc = 'Repeat last move previous' }
  )
end

M.easy_align = function()
  map('v', 'ga', '<Plug>(EasyAlign)', silent_noremap, 'Easy Align')
end

M.latex = function()
  map('n', '<Leader>at', ':?tabular<CR>jv/tabular<CR>0:EasyAlign *&<CR>:noh<CR>', silent, 'Latex: Align table')
end

return M
