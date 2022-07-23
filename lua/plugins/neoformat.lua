local M = {}

local function lsp_support_formatting(clients)
  local lsp = require "plugins.lsp"
  for _, client in ipairs(clients) do
    local c = lsp.capabilities[client.name]
    if c and c.documentation_formatting then
      return true
    end
  end
  return false
end

M.format_buffer = function()
  -- Use LSP server's formatting capabilities by default
  -- fallback to Neoformat if the LSP does not support it
  local bufnr = vim.api.nvim_get_current_buf()
  local lsp_clients = vim.lsp.get_active_clients({["bufnr"] = bufnr})
  if lsp_support_formatting(lsp_clients) then
    vim.lsp.buf.formatting_sync()
  else
    vim.cmd("Neoformat")
  end
end

return M
