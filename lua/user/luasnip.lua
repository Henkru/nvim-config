local ls = require('luasnip')
ls.config.set_config({
  history = true,
  update_events = 'TextChanged,TextChangedI',
})

require('luasnip.loaders.from_vscode').lazy_load()

-- Load Custom Snippets
for _, path in ipairs(vim.api.nvim_get_runtime_file('lua/user/snips/*.lua', true)) do
  local ft = vim.fn.fnamemodify(path, ':t:r')
  local snippets = loadfile(path)()
  ls.add_snippets(ft, snippets)
end
