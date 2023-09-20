local M = {}

M.autocmd_ids = {}

M.setup = function()
  vim.api.nvim_create_user_command('SaveCmd', function(args)
    local bufnr = vim.api.nvim_get_current_buf()

    vim.api.nvim_create_augroup('SaveCmd', { clear = true })
    local id = vim.api.nvim_create_autocmd('BufWritePost', {
      group = 'SaveCmd',
      buffer = 0,
      callback = function()
        vim.api.nvim_command(':! ' .. args.args)
      end,
    })

    M.autocmd_ids[bufnr] = id
  end, { nargs = '?' })

  vim.api.nvim_create_user_command('ClearSaveCmd', function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.api.nvim_del_autocmd(M.autocmd_ids[bufnr])
  end, {})
end

return M
