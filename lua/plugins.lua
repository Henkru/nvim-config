require('henkru.lazy').bootstrap().setup({
  -- Meta --
  {
    'nvim-lua/plenary.nvim',
    commit = '857c5ac632080dba10aae49dba902ce3abf91b35',
  },

  -- UI --
  {
    'kyazdani42/nvim-web-devicons',
    commit = '4c3a5848ee0b09ecdea73adcd2a689190aeb728c',
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('henkru.lualine').setup()
    end,
    commit = '1517caa8fff05e4b4999857319d3b0609a7f57fa',
  },

  {
    'arkav/lualine-lsp-progress',
    commit = '56842d097245a08d77912edf5f2a69ba29f275d7',
  },

  {
    'akinsho/bufferline.nvim',
    config = function()
      require('henkru.bufferline')
    end,
    commit = '655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3',
  },

  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('henkru.nvimtree')
      require('mappings').nvimtree()
    end,
    commit = '44d9b58f11d5a426c297aafd0be1c9d45617a849',
  },

  {
    'b0o/incline.nvim',
    config = function()
      require('henkru.incline')
    end,
    commit = '27040695b3bbfcd3257669037bd008d1a892831d',
  },

  -- Telescope --
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('henkru.telescope')
      require('mappings').telescope()
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'henkru/telescope-hoogle.nvim',
    },
    commit = 'a4ed82509cecc56df1c7138920a1aeaf246c0ac5',
  },

  {
    'henkru/telescope-hoogle.nvim',
    commit = '8fe045d363afc64d9bb34ad4b75247e943e5d4bc',
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    commit = '1f08ed60cafc8f6168b72b80be2b2ea149813e55',
  },

  {
    'nvim-telescope/telescope-ui-select.nvim',
    commit = '6e51d7da30bd139a6950adf2a47fda6df9fa06d2',
  },

  -- General --
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('henkru.indentblankline')
    end,
    commit = '005b56001b2cb30bfa61b7986bc50657816ba4ba',
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({})
    end,
    commit = '3c76f7fabac723aa682365ef782f88a83ccdb4ac',
  },

  {
    'catppuccin/nvim',
    config = function()
      require('henkru.catppuccin')
    end,
    commit = '5b5e3aef9ad7af84f463d17b5479f06b87d5c429',
  },

  {
    'numtostr/comment.nvim',
    config = function()
      require('Comment').setup()
    end,
    commit = 'e30b7f2008e52442154b66f7c519bfd2f1e32acb',
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
    commit = '84a81a7d1f28b381b32acf1e8fe5ff5bef4f7968',
  },

  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({})
    end,
    commit = '370ec46f710e058c9c1646273e6b225acf47cbed',
  },

  {
    'junegunn/vim-easy-align',
    commit = '9815a55dbcd817784458df7a18acacc6f82b1241',
    config = function()
      require('mappings').easy_align()
    end,
  },

  -- LSP --
  {
    'williamboman/mason.nvim',
    config = function()
      require('henkru.mason')
    end,
    commit = 'fc98833b6da5de5a9c5b1446ac541577059555be',
  },

  {
    'williamboman/mason-lspconfig.nvim',
    commit = '1a31f824b9cd5bc6f342fc29e9a53b60d74af245',
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      require('henkru.lsp')
      require('mappings').lsp_global()
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'nvim-cmp',
    },
    commit = '40f120c10ea4b87311175539a183c3b75eab95a3',
  },

  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('henkru.lsp_signature')
    end,
    commit = 'b58cca003d1d3311213d6db0352f58d8e57bfff0',
  },

  {
    'nvimtools/none-ls.nvim',
    config = function()
      require('henkru.null-ls')
    end,
    commit = 'a117163db44c256d53c3be8717f3e1a2a28e6299',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup({})
      require('mappings').trouble()
    end,
    commit = '85bedb7eb7fa331a2ccbecb9202d8abba64d37b3',
  },

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()
    end,
    commit = 'a92c755f182b89ea91bd8a6a2227208026f27b4d',
  },

  -- Treesitter --
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('henkru.treesitter')
    end,
    commit = 'cfc6f2c117aaaa82f19bcce44deec2c194d900ab',
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      require('mappings').treesitter()
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    commit = '9937e5e356e5b227ec56d83d0a9d0a0f6bc9cad4',
  },

  -- Autocompletion --
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('henkru.nvim-cmp')
    end,
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
    },
    commit = '059e89495b3ec09395262f16b1ad441a38081d04',
  },

  {
    'hrsh7th/cmp-nvim-lsp',
    commit = 'a8912b88ce488f411177fc8aed358b04dc246d7b',
  },

  {
    'saadparwaiz1/cmp_luasnip',
    commit = '98d9cb5c2c38532bd9bdb481067b20fea8f32e90',
  },

  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('henkru.luasnip')
    end,
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    build = 'make install_jsregexp',
    commit = 'c9b9a22904c97d0eb69ccb9bab76037838326817',
  },

  {
    'hrsh7th/cmp-buffer',
    commit = 'b74fab3656eea9de20a9b8116afa3cfc4ec09657',
  },

  {
    'hrsh7th/cmp-path',
    commit = 'c6635aae33a50d6010bf1aa756ac2398a2d54c32',
  },

  {
    'hrsh7th/cmp-nvim-lua',
    commit = 'f12408bdb54c39c23e67cab726264c10db33ada8',
  },

  {
    'rafamadriz/friendly-snippets',
    commit = 'efff286dd74c22f731cdec26a70b46e5b203c619',
  },

  -- LLM --
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('henkru.codecompanion')
    end,
    commit = 'b02a7da50e8d1ee473a31f79152dcdf8f7abf5d5',
  },
})
