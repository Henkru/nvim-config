local group = vim.api.nvim_create_augroup('nvim-config', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = group,
  desc = 'Highlight when yanking text',
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  group = group,
  desc = 'Disable comment continuation on new lines',
  callback = function()
    vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
  end,
})

require('config.save_cmd')

vim.filetype.add({
  extension = {
    sl = 'sleep',
    cna = 'sleep',
    profile = 'malleable_c2',
  },
})
