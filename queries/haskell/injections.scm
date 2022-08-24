(exp_apply
    (exp_name (variable) @_fname (#match? @_fname "^(execute|executeMany|query)_?$"))
    (quasiquote (quasiquote_body) @sql)
)
