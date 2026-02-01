local M = {}

M.autocmd_ids = {}
M.autocmd_ids_local = {}
M.notify_on_success = false
M.strict_mode = false

local function run_command(args)
  if args == '' then
    return
  end

  local expanded = vim.fn.expandcmd(args)
  local parts
  if M.strict_mode then
    parts = vim.split(expanded, ' ', { trimempty = true })
  else
    local shell = vim.o.shell
    local shell_flags = vim.split(vim.o.shellcmdflag, ' ', { trimempty = true })
    parts = { shell }
    vim.list_extend(parts, shell_flags)
    table.insert(parts, expanded)
  end

  vim.system(parts, { text = true }, function(result)
    if result.code ~= 0 then
      local output = result.stderr
      if output == nil or output == '' then
        output = result.stdout
      end
      output = output or 'SaveCmd failed'
      vim.schedule(function()
        vim.notify(output, vim.log.levels.ERROR)
      end)
    elseif M.notify_on_success then
      local output = result.stdout
      if output == nil or output == '' then
        output = 'SaveCmd completed'
      end
      vim.schedule(function()
        vim.notify(output, vim.log.levels.INFO)
      end)
    end
  end)
end

M.setup = function()
  vim.api.nvim_create_user_command('SaveCmd', function(args)
    local bufnr = vim.api.nvim_get_current_buf()

    vim.api.nvim_create_augroup('SaveCmdGlobal', { clear = true })
    local id = vim.api.nvim_create_autocmd('BufWritePost', {
      group = 'SaveCmdGlobal',
      buffer = 0,
      callback = function()
        run_command(args.args)
      end,
    })

    M.autocmd_ids[bufnr] = id
  end, { nargs = '?' })

  vim.api.nvim_create_user_command('ClearSaveCmd', function()
    local bufnr = vim.api.nvim_get_current_buf()
    local id = M.autocmd_ids[bufnr]
    if id then
      vim.api.nvim_del_autocmd(id)
    end
  end, {})

  vim.api.nvim_create_user_command('SaveCmdLocal', function(args)
    local bufnr = vim.api.nvim_get_current_buf()
    vim.api.nvim_create_augroup('SaveCmdLocal', { clear = false })
    local id = vim.api.nvim_create_autocmd('BufWritePost', {
      group = 'SaveCmdLocal',
      buffer = 0,
      callback = function()
        run_command(args.args)
      end,
    })
    M.autocmd_ids_local[bufnr] = id
  end, { nargs = '?' })

  vim.api.nvim_create_user_command('ClearSaveCmdLocal', function()
    local bufnr = vim.api.nvim_get_current_buf()
    local id = M.autocmd_ids_local[bufnr]
    if id then
      vim.api.nvim_del_autocmd(id)
    end
  end, {})

  vim.api.nvim_create_user_command('SaveCmdNotifyToggle', function()
    M.notify_on_success = not M.notify_on_success
    vim.notify(string.format('SaveCmd notify: %s', M.notify_on_success and 'on' or 'off'), vim.log.levels.INFO)
  end, {})

  vim.api.nvim_create_user_command('SaveCmdStrictToggle', function()
    M.strict_mode = not M.strict_mode
    vim.notify(string.format('SaveCmd strict: %s', M.strict_mode and 'on' or 'off'), vim.log.levels.INFO)
  end, {})
end

M.setup()

return M
