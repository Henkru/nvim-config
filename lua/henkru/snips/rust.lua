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

return {
  s('test', {
    t('#[cfg(test)]'),
    newline('mod tests {'),
    newline('    use super::*;'),
    newline(''),
    newline('    #[test]'),
    newline('    fn it_works() {'),
    newline('        let result = 4'),
    newline('        assert_eq!(result, 4);'),
    newline('    }'),
    newline('}'),
  }),
}
