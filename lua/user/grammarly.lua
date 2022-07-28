local M = {}

local with_grammarly = function(show_error, callback)
  local clients = vim.lsp.get_active_clients({ name = 'grammarly' })
  local grammarly = next(clients)
  if grammarly then
    callback(grammarly)
  elseif show_error then
    vim.notify('Grammarly LSP is not attached', vim.log.levels.ERROR)
  end
end

M.account_connected = false

M.get_oauth_url = function()
  with_grammarly(true, function(grammarly)
    vim.lsp.buf_request(grammarly, '$/getOAuthUrl', 'vscode://znck.grammarly/auth/callback', function(_, result, _, _)
      vim.notify(result, vim.log.levels.INFO)
    end)
  end)
end

M.login = function(url)
  with_grammarly(true, function(grammarly)
    vim.lsp.buf_request(grammarly, '$/handleOAuthCallbackUri', url, function(err, _, _, _)
      if err ~= nil then
        vim.notify(err.message, vim.log.levels.ERROR)
      else
        vim.notify('Account Connected', vim.log.levels.INFO)
        M.update_account_status()
      end
    end)
  end)
end

M.logout = function()
  with_grammarly(true, function(grammarly)
    vim.lsp.buf_request(grammarly, '$/logout', nil, function(_, _, _, _)
      vim.notify('Account Logged Out', vim.log.levels.INFO)
      M.update_account_status()
    end)
  end)
end

M.update_account_status = function()
  with_grammarly(false, function(grammarly)
    vim.lsp.buf_request(grammarly, '$/isUserAccountConnected', nil, function(_, res, _, _)
      M.account_connected = res
    end)
  end)
end

M.status_line = function()
  local clients = vim.lsp.get_active_clients({
    bufnr = 0,
    name = 'grammarly',
  })
  if next(clients) then
    M.update_account_status()
    return M.account_connected and 'Grammarly' or 'Grammarly [N]'
  else
    return ''
  end
end

M.status_line()

return M
