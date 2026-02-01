"sub" @keyword
"inline" @keyword
"if" @keyword
"else" @keyword
"while" @keyword
"for" @keyword
"foreach" @keyword
"continue" @keyword
"break" @keyword
"try" @keyword
"catch" @keyword
"throw" @keyword
"return" @keyword
"yield" @keyword

"+" @operator
"-" @operator
"*" @operator
"/" @operator
"%" @operator
"**" @operator
"<=>" @operator
"&&" @operator
"||" @operator
"==" @operator
"!=" @operator
">" @operator
"<" @operator
">=" @operator
"<=" @operator
"|" @operator
"^" @operator
"&" @operator
"<<" @operator
">>" @operator
"." @operator
"x" @operator
"cmp" @operator
"eq" @operator
"ne" @operator
"lt" @operator
"gt" @operator
"isin" @operator
"iswm" @operator
"ismatch" @operator
"hasmatch" @operator
"=~" @operator
"is" @operator
"isa" @operator
"=>" @operator

(unary_expression
  operator: (_) @operator)

(semicolon) @delimiter

(string_double) @string
(string_single) @string

(integer) @number
(long) @number
(double) @number
(null) @constant

(variable) @variable
(array_variable) @variable
(hash_variable) @variable

(call_expression
  function: (identifier) @function)

(function_definition
  name: (_) @function)

(general_definition
  type: (_) @keyword
  name: (identifier) @function)

(general_definition
  type: (_) @keyword
  name: (string_single) @string)

(general_definition
  type: (_) @keyword
  name: (string_double) @string)

(comment) @comment
