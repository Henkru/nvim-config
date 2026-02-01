vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false

require('config.options')
require('keymaps').general()
require('config.autocmds')
require('config.diagnostics')
require('config.lazy')
