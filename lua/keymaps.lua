local M = {}

local function map(mode, lhs, rhs, opts, desc)
  opts = opts or {}
  if desc then
    opts.desc = desc
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- General
M.general = function()
  map('v', 'p', '"_dP', { noremap = true }, 'Paste without yanking')

  map('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true }, 'Clear search highlight')

  map('n', '<C-h>', '<C-w><C-h>', { silent = true }, 'Window: Left')
  map('n', '<C-l>', '<C-w><C-l>', { silent = true }, 'Window: Right')
  map('n', '<C-j>', '<C-w><C-j>', { silent = true }, 'Window: Down')
  map('n', '<C-k>', '<C-w><C-k>', { silent = true }, 'Window: Up')

  map('n', 'c', '"_c', { noremap = true }, 'Change without yanking')
  map('n', 'C', '"_C', { noremap = true }, 'Change line without yanking')
  map('n', 'cc', '"_cc', { noremap = true }, 'Change line without yanking')
  map('n', 'x', '"_x', { noremap = true }, 'Delete char without yanking')
  map('x', 'c', '"_c', { noremap = true }, 'Change without yanking')
  map('x', 'x', '"_x', { noremap = true }, 'Delete without yanking')

  map('n', '<TAB>', '<cmd>BufferLineCycleNext<CR>', { silent = true }, 'Buffer: Next')
  map('n', '<S-TAB>', '<cmd>BufferLineCyclePrev<CR>', { silent = true }, 'Buffer: Previous')

  map('n', '<leader>t', function()
    require('oil').toggle_float()
  end, { silent = true }, 'File Explorer: Toggle')

  map('n', '<C-n>', '<cmd>enew<CR>', { silent = true }, 'Buffer: New')
  map('n', '<C-x>', '<cmd>bd<CR>', { silent = true }, 'Buffer: Close')
  map('n', '<C-X>', '<cmd>bd!<CR>', { silent = true }, 'Buffer: Close!')

  map('t', '<Esc><Esc>', '<C-\\><C-n>', { silent = true }, 'Terminal: Exit')
end

-- Telescope

M.telescope = function()
  local builtin = require('telescope.builtin')
  map('n', '<leader>ff', builtin.find_files, nil, 'Telescope: Find Files')
  map('n', '<leader>fg', builtin.live_grep, nil, 'Telescope: Live Grep')
  map('n', '<leader>fb', builtin.buffers, nil, 'Telescope: Buffers')
  map('n', '<leader>fd', builtin.lsp_definitions, nil, 'Telescope: LSP Definitions')
  map('n', '<leader>fi', builtin.lsp_implementations, nil, 'Telescope: LSP Implementations')
  map('n', '<leader>fn', function()
    builtin.find_files({ cwd = vim.fn.stdpath('config') })
  end, nil, 'Telescope: Neovim Config')
  map('n', '<leader>ft', builtin.help_tags, nil, 'Telescope: Help Tags')
  map('n', '<leader>fT', '<cmd>Telescope<CR>', nil, 'Telescope: Pickers')
  map('n', '<leader>fr', builtin.lsp_references, nil, 'Telescope: LSP References')
  map('n', '<leader>fR', builtin.reloader, nil, 'Telescope: Reloader')
  map('n', '<leader>fsd', builtin.lsp_document_symbols, nil, 'Telescope: LSP Document Symbols')
  map('n', '<leader>fsw', builtin.lsp_workspace_symbols, nil, 'Telescope: LSP Workspace Symbols')
  map('n', '<leader>/', builtin.current_buffer_fuzzy_find, nil, 'Telescope: Current Buffer')
  map('n', '<leader>fk', builtin.keymaps, nil, 'Telescope: Key Maps')
end

-- LSP

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

-- Completion

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

-- Treesitter

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

-- Editing

M.easy_align = function()
  map('v', 'ga', '<Plug>(EasyAlign)', { silent = true }, 'Easy Align')
end

-- DAP

M.dap = function(helpers)
  local dap = require('dap')
  local dapui = require('dapui')
  local launch_current = helpers and helpers.launch_current or dap.continue

  map('n', '<F5>', launch_current, { silent = true, noremap = true }, 'DAP: Continue')
  map('n', '<F10>', dap.step_over, { silent = true, noremap = true }, 'DAP: Step Over')
  map('n', '<F11>', dap.step_into, { silent = true, noremap = true }, 'DAP: Step Into')
  map('n', '<F12>', dap.step_out, { silent = true, noremap = true }, 'DAP: Step Out')

  map('n', '<leader>b', dap.toggle_breakpoint, { silent = true, noremap = true }, 'DAP: Toggle Breakpoint')
  map('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
  end, { silent = true, noremap = true }, 'DAP: Conditional Breakpoint')

  map('n', '<leader>dr', dap.repl.open, { silent = true, noremap = true }, 'DAP: Open REPL')
  map('n', '<leader>du', dapui.toggle, { silent = true, noremap = true }, 'DAP: Toggle UI')
end

-- Diagnostics UI

M.trouble = function()
  map('n', '<leader>xx', '<cmd>Trouble<CR>', { silent = true, noremap = true }, 'Diagnostic: Toggle')
  map(
    'n',
    '<leader>xw',
    '<cmd>Trouble lsp_workspace_diagnostics<CR>',
    { silent = true, noremap = true },
    'Diagnostic: LSP Workspace'
  )
  map(
    'n',
    '<leader>xd',
    '<cmd>Trouble lsp_document_diagnostics<CR>',
    { silent = true, noremap = true },
    'Diagnostic: LSP Document'
  )
  map('n', '<leader>xl', '<cmd>Trouble loclist<CR>', { silent = true, noremap = true }, 'Diagnostic: Location List')
  map('n', '<leader>xq', '<cmd>Trouble quickfix<CR>', { silent = true, noremap = true }, 'Diagnostic: Quickfix')
end

M.lsp_lines = function()
  map('n', '<leader>hd', require('lsp_lines').toggle, { silent = true }, 'LSP: Toggle Lines')
end

-- Opencode

M.opencode = function()
  local opencode = require('opencode')
  map({ 'n', 'x' }, '<leader>oa', function()
    opencode.ask('@this: ', { submit = true })
  end, { silent = true }, 'Opencode: Ask')
  map({ 'n', 'x' }, '<leader>os', function()
    opencode.select()
  end, { silent = true }, 'Opencode: Select')
  map({ 'n', 'x' }, '<leader>ot', function()
    opencode.toggle()
  end, { silent = true }, 'Opencode: Toggle')
  map('n', 'go', function()
    return opencode.operator('@this ')
  end, { expr = true, silent = true }, 'Opencode: Operator')
  map('n', 'goo', function()
    return opencode.operator('@this ') .. '_'
  end, { expr = true, silent = true }, 'Opencode: Line')
end

return M
