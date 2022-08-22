local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt

local newline = function(text)
  return t({ '', text })
end

return {

  s('hscript', {
    t('#!/usr/bin/env stack'),
    newline('{- stack'),
    newline(' script'),
    newline(' --resolver lts-19.20'),
    newline('-}'),
  }),
}
