local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt

local require_var = function(args, _)
  local text = args[1][1] or ''
  local split = vim.split(text, '.', { plain = true })

  local options = {}
  for len = 0, #split - 1 do
    table.insert(options, t(table.concat(vim.list_slice(split, #split - len, #split), '_')))
  end

  return sn(nil, {
    c(1, options),
  })
end

local newline = function(text)
  return t({ '', text })
end

return {
  s('ignore', t('-- stylua: ignore')),
  s('lf', {
    t('local '),
    i(1),
    t(' = function('),
    i(2),
    t(')'),
    t({ '', ' ' }),
    i(0),
    t({ '', 'end' }),
  }),
  s('mf', {
    t('M.'),
    i(1),
    t(' = function('),
    i(2),
    t(')'),
    t({ '', ' ' }),
    i(0),
    t({ '', 'end' }),
  }),
  s(
    'req',
    fmt([[local {} = require('{}')]], {
      d(2, require_var, { 1 }),
      i(1),
    })
  ),
  s('plugin', {
    t('use {'),
    newline("  '"),
    i(1),
    t("',"),
    newline("  commit = '"),
    i(0),
    t("',"),
    newline('}'),
  }),
}
