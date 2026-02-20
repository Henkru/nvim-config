local oil = require('oil')
oil.setup({
  keymaps = {
    -- Copy the full file path of the selected entry
    ['<leader>y'] = {
      function()
        local entry = oil.get_cursor_entry()
        local full_path = vim.fs.joinpath(oil.get_current_dir(), entry['name'])
        vim.fn.setreg('+', full_path)
      end,
      mode = 'n',
    },
  },
  view_options = {
    is_hidden_file = function(name, bufnr)
      if name == '.github' then
        return false
      end
      local m = name:match('^%.')
      return m ~= nil
    end,
  },
})
