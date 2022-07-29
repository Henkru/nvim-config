local map = vim.api.nvim_set_keymap

local M = {}

M.general = function()
  -- Don't copy the replaced text after pasting in visual mode
  map('v', 'p', '"_dP', { noremap = true })

  -- Use ESC to turn off search highlighting
  map('n', '<Esc>', ':noh <CR>', { silent = true })

  -- Easier navigation between windows
  map('n', '<C-h>', '<C-w>h', { noremap = true })
  map('n', '<C-l>', '<C-w>l', { noremap = true })
  map('n', '<C-k>', '<C-w>k', { noremap = true })
  map('n', '<C-j>', '<C-w>j', { noremap = true })
  map('n', '<C-c>', '<C-w>c', { noremap = true }) -- C-c to close window

  map('n', '<TAB>', ':BufferLineCycleNext <CR>', {})
  map('n', '<S-TAB>', ':BufferLineCyclePrev <CR>', {})

  -- Create/Close buffer
  map('n', '<C-n>', ':enew <CR>', { silent = true })
  map('n', '<C-x>', ':bd <CR>', { silent = true })
  map('n', '<C-X>', ':bd! <CR>', { silent = true })

  -- Indent without leaving visual mode
  map('v', '<', '<gv', { noremap = true })
  map('v', '>', '>gv', { noremap = true })

  -- Terminal related
  -- map("n", "<Leader>Tt", ":terminal <CR>", {silent = true})
  map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

  -- Don't replace the clipboard when changing the block
  map('n', 'c', '"_c', { noremap = true })
  map('n', 'C', '"_C', { noremap = true })
  map('n', 'cc', '"_cc', { noremap = true })
  map('x', 'c', '"_c', { noremap = true })

  -- Move between tabs
  map('n', '<Right>', 'gt', { noremap = true })
  map('n', '<Left>', 'gT', { noremap = true })
end

M.lsp = function(bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<Leader>hd', '<cmd>lua require("lsp_lines").toggle()<CR>', opts)
  buf_set_keymap('n', '<Leader>hs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>wl', '<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>', opts)
  buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<Leader>F', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
end

M.lsp_global = function()
  -- stylua: ignore
  map('n', '<Leader>G', ':lua require"lspconfig"["grammarly"].manager.try_add()<CR>', { noremap = true, silent = true })
end

M.nvimtree = function()
  map('n', '<Leader>t', ':NvimTreeToggle<CR>', { silent = true })
end

M.comment = function()
  -- map('n', '<Leader>/', 'gcc', {})
  -- map('v', '<Leader>/', 'gcc', {})
end

M.telescope = function()
  map('n', '<Leader>ff', ':Telescope find_files <CR>', { noremap = true })
  map('n', '<Leader>fg', ':Telescope live_grep <CR>', { noremap = true })
  map('n', '<Leader>fb', ':Telescope buffers <CR>', { noremap = true })
  map('n', '<Leader>fd', ':Telescope lsp_definitions <CR>', { noremap = true })
  map('n', '<Leader>fi', ':Telescope lsp_implementations <CR>', { noremap = true })
  map('n', '<Leader>fn', ':Telescope find_files cwd=~/.config/nvim <CR>', { noremap = true })
  map('n', '<Leader>ft', ':Telescope help_tags <CR>', { noremap = true })
  map('n', '<Leader>fT', ':Telescope <CR>', { noremap = true })
  map('n', '<Leader>fh', ":lua require 'user.hoogle'.list() <CR>", { noremap = true })
  map('n', '<Leader>fr', ':Telescope lsp_references <CR>', { noremap = true })
  map('n', '<Leader>fR', ':Telescope reloader <CR>', { noremap = true })
  map('n', '<Leader>fsd', ':Telescope lsp_document_symbols <CR>', { noremap = true })
  map('n', '<Leader>fsw', ':Telescope lsp_workspace_symbols <CR>', { noremap = true })
  map('n', '<Leader>/', ':Telescope current_buffer_fuzzy_find <CR>', { noremap = true })
end

M.trouble = function()
  map('n', '<Leader>xx', '<cmd>Trouble<cr>', { silent = true, noremap = true })
  map('n', '<Leader>xw', '<cmd>Trouble lsp_workspace_diagnostics<cr>', { silent = true, noremap = true })
  map('n', '<Leader>xd', '<cmd>Trouble lsp_document_diagnostics<cr>', { silent = true, noremap = true })
  map('n', '<Leader>xl', '<cmd>Trouble loclist<cr>', { silent = true, noremap = true })
  map('n', '<Leader>xq', '<cmd>Trouble quickfix<cr>', { silent = true, noremap = true })
end

M.debug = function()
  -- Start / stop debug session
  map('n', '<Leader>dd', '<cmd>lua require"dap".continue()<cr>', { silent = true, noremap = true })
  map('n', '<Leader>ds', '<cmd>lua require"dap".close()<cr>', { silent = true, noremap = true })
  map('n', '<Leader>dx', '<cmd>lua require"dap".terminate()<cr>', { silent = true, noremap = true })

  -- Step commands
  map('n', '<F1>', '<cmd>lua require"dap".continue()<cr>', { silent = false, noremap = true })
  map('n', '<F2>', '<cmd>lua require"dap".step_over()<cr>', { silent = false, noremap = true })
  map('n', '<F3>', '<cmd>lua require"dap".step_into()<cr>', { silent = true, noremap = true })
  map('n', '<F4>', '<cmd>lua require"dap".step_out()<cr>', { silent = true, noremap = true })
  map('n', '<Leader>dc', '<cmd>lua require"dap".run_to_cursor()<cr>', { silent = true, noremap = true })

  -- Set breakpoints
  map('n', '<Leader>db', '<cmd>lua require"dap".toggle_breakpoint()<cr>', { silent = true })
  map('n', '<Leader>dB', '<cmd>lua require"dap".set_breakpoint(vim.fn.input "[Condition] > ")<cr>', { silent = true })
end

M.maximizer = function()
  map('n', '<Leader>m', ':MaximizerToggle <CR>', { silent = true })
end

M.floaterm = function()
  map('n', '<Leader>T', ':FloatermToggle <CR>', { silent = true })
end

M.cmp = function()
  local cmp = require('cmp')
  local ls = require('luasnip')
  return {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-c>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<C-j>'] = cmp.mapping(function(fallback)
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['C-l>'] = function(fallback)
      if ls.choice_active() then
        ls.change_choice(1)
      else
        fallback()
      end
    end,
  }
end

return M
