local nvimtree = require('nvim-tree')

nvimtree.setup({
  git = {
    enable = false,
  },
  renderer = {
    root_folder_modifier = table.concat({ ':t:gs?$?/..', string.rep(' ', 1000), '?:gs?^??' }),
    highlight_git = true,
    indent_markers = {
      enable = false,
    },
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        git = {
          deleted = '',
          ignored = '◌',
          renamed = '➜',
          staged = '✓',
          unmerged = '',
          unstaged = '✗',
          untracked = '★',
        },
        folder = {
          arrow_open = '',
          arrow_closed = '',
          default = '',
          empty = '',
          empty_open = '',
          open = '',
          symlink = '',
          symlink_open = '',
        },
      },
    },
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  filters = {
    dotfiles = false,
    custom = { '.git', 'node_modules', '.cache' },
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    side = 'left',
    width = 25,
  },
})
