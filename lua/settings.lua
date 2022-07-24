local cmd = vim.cmd           	-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn    		        -- call Vim functions
local g = vim.g        		      -- global variables
local opt = vim.opt       	    -- global/buffer/windows-scoped options

-- General --
g.mapleader = ' '
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.hidden = true

-- UI --
opt.relativenumber = true     -- show relative line number
opt.showmatch = true          -- highlight matching parenthesis
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- orizontal split to the bottom
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.linebreak = true          -- wrap on word boundary
opt.signcolumn = 'yes'

-- Color --
opt.termguicolors = true

-- Indentation --
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines
opt.autoindent = true

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,typescript setlocal shiftwidth=2 tabstop=2
]]

-- don't auto commenting new lines
cmd [[
  au BufEnter * set fo-=c fo-=r fo-=o
]]

-- Detect ansible files
cmd [[
  au BufRead *.yaml,*.yml if search('hosts:\|tasks:', 'nw') | set ft=yaml.ansible | endif
  au BufRead,BufNewFile */roles/*.yml set filetype=yaml.ansible
]]
