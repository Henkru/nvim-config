return {
  {
    'nvim-telescope/telescope.nvim',
    commit = '3333a52ff548ba0a68af6d8da1e54f9cd96e9179',
    event = 'VimEnter',
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        commit = '6fea601bd2b694c6f2ae08a6c6fab14930c60e2c',
        build = 'make',
      },
      {
        'nvim-telescope/telescope-ui-select.nvim',
        commit = '6e51d7da30bd139a6950adf2a47fda6df9fa06d2',
      },
    },
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup({
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
          },
          prompt_prefix = ' ?  ',
          selection_caret = '  ',
          entry_prefix = '  ',
          initial_mode = 'insert',
          selection_strategy = 'reset',
          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.45,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_sorter = require('telescope.sorters').get_fuzzy_file,
          file_ignore_patterns = { 'node_modules', 'external' },
          generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
          path_display = { 'absolute' },
          winblend = 0,
          border = {},
          borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          color_devicons = true,
          use_less = true,
          set_env = { ['COLORTERM'] = 'truecolor' },
          file_previewer = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
          buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
          mappings = {
            i = {
              ['<esc>'] = actions.close,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({}),
          },
        },
      })

      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ui-select')
      require('keymaps').telescope()

      vim.api.nvim_create_autocmd('User', {
        pattern = 'TelescopePreviewerLoaded',
        callback = function()
          vim.opt_local.wrap = true
        end,
      })
    end,
  },
}
