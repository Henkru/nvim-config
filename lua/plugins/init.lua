local plugins = {}

local function extend(list)
  for _, item in ipairs(list) do
    table.insert(plugins, item)
  end
end

extend(require('plugins.core'))
extend(require('plugins.ui'))
extend(require('plugins.ui-extras'))
extend(require('plugins.ai'))
extend(require('plugins.lsp'))
extend(require('plugins.tools'))
extend(require('plugins.oil'))
extend(require('plugins.completion'))
extend(require('plugins.treesitter'))
extend(require('plugins.editor'))
extend(require('plugins.dap'))
extend(require('plugins.lsp-extras'))

return plugins
