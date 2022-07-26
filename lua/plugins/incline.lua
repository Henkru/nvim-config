local basic = require('incline.presets.basic')
require('incline').setup({
  render = function(...)
    local windows = vim.api.nvim_tabpage_list_wins(0)
    return #windows > 2 and basic(...) or ''
  end
})
