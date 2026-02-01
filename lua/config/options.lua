local opt = vim.opt

-- Defer clipboard to avoid UI startup delays
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = false
opt.signcolumn = 'yes'
opt.termguicolors = true
opt.scrolloff = 10
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Editor behavior
opt.mouse = 'a'
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.inccommand = 'split'
opt.confirm = true

-- Window splits
opt.splitright = true
opt.splitbelow = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.autoindent = true

-- Files
opt.swapfile = false
opt.hidden = true
