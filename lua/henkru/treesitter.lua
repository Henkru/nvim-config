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

require('nvim-treesitter.parsers').get_parser_configs().malleable_c2 = {
  install_info = {
    url = 'https://github.com/Henkru/tree-sitter-malleable-c2',
    files = { 'src/parser.c' },
    branch = 'main',
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = 'malleable_c2',
}

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'c',
    'lua',
    'vim',
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
    'vimdoc',
    'rust',
    'go',
    'bash',
    'nix',
    -- 'swift',
  },
  sync_install = false,
  auto_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
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
