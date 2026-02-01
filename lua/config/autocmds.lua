local group = vim.api.nvim_create_augroup('nvim-config', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = group,
  desc = 'Highlight when yanking text',
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.filetype.add({
  extension = {
    sl = 'sleep',
    cna = 'sleep',
    profile = 'malleable_c2',
  },
})
