local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

-- stylua: ignore start
-- General --
g.mapleader = ' '
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.hidden = true

-- UI --
opt.relativenumber = true -- show relative line number
opt.showmatch = true -- highlight matching parenthesis
opt.foldmethod = 'marker' -- enable folding (default 'foldmarker')
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern
opt.linebreak = true -- wrap on word boundary
opt.signcolumn = 'yes'

-- Color --
opt.termguicolors = true

-- Indentation --
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines
opt.autoindent = true
-- stylua: ignore end

-- 2 spaces for selected filetypes
cmd([[
  autocmd FileType xml,html,xhtml,css,scss,haskell,javascript,lua,yaml,typescript,systemverilog,verilog setlocal shiftwidth=2 tabstop=2
]])

-- don't auto commenting new lines
cmd([[
  au BufEnter * set fo-=c fo-=r fo-=o
]])

-- Detect ansible files
cmd([[
  au BufRead *.yaml,*.yml if search('hosts:\|tasks:', 'nw') | set ft=yaml.ansible | endif
  au BufRead,BufNewFile */roles/*.yml set filetype=yaml.ansible
]])

cmd([[
  au BufRead plugins.lua lua require 'user.update'
]])

-- Fusesoc .core files are yaml
cmd([[
  au BufRead,BufNewFile *.core set filetype=yaml
]])

-- Sleep files
cmd([[
  au BufRead,BufNewFile *.sl,*.cna set filetype=sleep
]])

-- Malleable C2
cmd([[
  au BufRead,BufNewFile *.profile set filetype=malleable_c2
]])
