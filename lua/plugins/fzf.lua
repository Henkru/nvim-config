local M = {}

M.fzf = function()
  vim.cmd('split')
  vim.cmd("terminal fzf --cycle --reverse --bind 'tab:toggle-down,btab:toggle-up'")
end

M.cb = function(exitCode)
  local fpath = vim.fn.getline(1)
  vim.cmd('bdel')
  if exitCode == 0 then
    vim.cmd('edit ' .. vim.fn.fnameescape(fpath)) 
  end
end

M.setup = function()
  vim.cmd [[
    autocmd TermOpen term://*:fzf* startinsert
    autocmd TermOpen term://*:fzf* set nobuflisted
  ]]

  vim.cmd [[
    autocmd TermClose term://*:fzf* exe ':lua require("plugins.fzf").cb('..v:event.status..')'
  ]]
end

return M
