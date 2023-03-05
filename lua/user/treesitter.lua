require('nvim-treesitter.parsers').get_parser_configs().sleep = {
  install_info = {
    url = 'https://github.com/Henkru/tree-sitter-sleep',
    files = { 'src/parser.c' },
    branch = 'main',
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = 'sleep',
}

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'c',
    'lua',
    'vim',
    'help',
    'html',
    'python',
    'haskell',
    'javascript',
    'typescript',
    'yaml',
    'dockerfile',
    'cpp',
    'markdown',
    'sql',
    'query', -- a requirement of the playground
  },
  auto_install = false,
  highlight = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
        ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
        ['am'] = '@comment.outer',
        ['im'] = '@comment.inner',
      },

      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']f'] = '@function.outer',
        [']]'] = { query = '@class.outer', desc = 'Next class start' },
        [']o'] = '@loop.*',
        [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
        [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
      },
      goto_next_end = {
        [']F'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[f'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[F'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
      goto_next = {
        [']d'] = '@conditional.outer',
      },
      goto_previous = {
        ['[d'] = '@conditional.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>sp'] = '@parameter.inner',
        ['<leader>sf'] = '@function.outer',
      },
      swap_previous = {
        ['<leader>sP'] = '@parameter.inner',
        ['<leader>sF'] = '@function.outer',
      },
    },
  },
})
