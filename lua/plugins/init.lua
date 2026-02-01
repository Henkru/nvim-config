local plugins = {}

local function extend(list)
  for _, item in ipairs(list) do
    table.insert(plugins, item)
  end
end

extend(require('plugins.core'))
extend(require('plugins.ui'))

return plugins
