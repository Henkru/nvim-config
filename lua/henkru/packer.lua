local M = {}
local packer = require('packer')

M.use = function(p)
  if p.commit then
    return packer.use(p)
  else
    vim.api.nvim_echo({
      {
        string.format(
          "Warning: Pluging '%s' is not pinned to the commit and will not be loaded.\nPlease add the commit hash.",
          p[1]
        ),
        'WarningMsg',
      },
    }, true, {})
  end
end

return setmetatable(M, { __index = packer })
