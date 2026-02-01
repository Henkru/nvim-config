return {
  {
    'hrsh7th/nvim-cmp',
    commit = '8c82d0bd31299dbff7f8e780f5e06d2283de9678',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        commit = '5a1e39223db9a0498024a77b8441169d260c8c25',
        build = 'make install_jsregexp',
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            commit = '6cd7280adead7f586db6fccbd15d2cac7e2188b9',
          },
        },
        config = function()
          local ls = require('luasnip')
          ls.config.set_config({
            history = true,
            update_events = 'TextChanged,TextChangedI',
          })
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },
      {
        'hrsh7th/cmp-nvim-lsp',
        commit = 'cbc7b02bb99fae35cb42f514762b89b5126651ef',
      },
      {
        'saadparwaiz1/cmp_luasnip',
        commit = '98d9cb5c2c38532bd9bdb481067b20fea8f32e90',
      },
      {
        'hrsh7th/cmp-buffer',
        commit = 'b74fab3656eea9de20a9b8116afa3cfc4ec09657',
      },
      {
        'hrsh7th/cmp-path',
        commit = 'c642487086dbd9a93160e1679a1327be111cbc25',
      },
      {
        'hrsh7th/cmp-nvim-lua',
        commit = 'e3a22cb071eb9d6508a156306b102c45cd2d573d',
      },
    },
    config = function()
      local cmp = require('cmp')

      local icons = {
        Text = '',
        Method = '',
        Function = '',
        Constructor = '',
        Field = 'ﰠ',
        Variable = '',
        Class = 'ﴯ',
        Interface = '',
        Module = '',
        Property = 'ﰠ',
        Unit = '塞',
        Value = '',
        Enum = '',
        Keyword = '',
        Snippet = '',
        Color = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = 'פּ',
        Event = '',
        Operator = '',
        TypeParameter = '',
      }

      cmp.setup({
        completion = {
          completeopt = 'menuone,noselect,noinsert',
          keyword_length = 3,
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
              nvim_lsp = '[LSP]',
              nvim_lua = '[Nvim]',
              buffer = '[BUF]',
            })[entry.source.name]
            return vim_item
          end,
        },
        window = {
          documentation = cmp.config.window.bordered(),
        },
        mapping = require('keymaps').cmp(),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'luasnip' },
        },
      })
    end,
  },
}
