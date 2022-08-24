local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt

local newline = function(text)
  return t({ '', text })
end

local module_name = function()
  return f(function(_args, snip)
    local name = snip.snippet.env.TM_FILENAME_BASE
    local path = vim.split(snip.snippet.env.TM_DIRECTORY, 'src/', true)[2] or ''
    local module_path = path:gsub('/', '.')
    if module_path ~= '' then
      return module_path .. '.' .. name
    else
      return name
    end
  end)
end

return {
  s('hscript', {
    t('#!/usr/bin/env stack'),
    newline('{- stack'),
    newline(' script'),
    newline(' --resolver lts-19.20'),
    newline('-}'),
  }),
  s('module', {
    t('module '),
    module_name(),
    t(' where'),
  }),
}
