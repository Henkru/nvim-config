local M = {}

local enabled = false

M.setup = function()
  vim.api.nvim_create_user_command('ChatGPTEnable', M.enable_chatgpt, {})
end

M.enable_chatgpt = function()
  require('chatgpt').setup({
    api_key_cmd = 'op read op://Personal/ChatGPT-API/password',
    actions_paths = {
      vim.fn.stdpath('config') .. '/lua/user/actions.json',
    },
  })
  enabled = true
end

M.is_enabled = function()
  return enabled
end

M.execute = function(command)
  if not M.is_enabled() then
    vim.notify('ChatGPT is not enabled', vim.log.levels.INFO)
  else
    vim.cmd(command)
  end
end

M.prompt = function()
  M.execute('ChatGPT')
end

M.rephrase = function()
  M.execute('ChatGPTRun rephrase')
end

return M
