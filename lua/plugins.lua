require('henkru.lazy').bootstrap().setup({
  -- Meta --
  {
    'nvim-lua/plenary.nvim',
    commit = 'b9fd5226c2f76c951fc8ed5923d85e4de065e509',
  },

  -- UI --
  {
    'kyazdani42/nvim-web-devicons',
    commit = '803353450c374192393f5387b6a0176d0972b848',
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('henkru.lualine').setup()
    end,
    commit = '47f91c416daef12db467145e16bed5bbfe00add8',
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
    commit = '037d89e60fb01a6c11a48a19540253b8c72a3c32',
  },

  {
    'b0o/incline.nvim',
    config = function()
      require('henkru.incline')
    end,
    commit = '8b54c59bcb23366645ae10edca6edfb9d3a0853e',
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
    commit = 'ad7d9580338354ccc136e5b8f0aa4f880434dcdc',
  },

  {
    'henkru/telescope-hoogle.nvim',
    commit = '8fe045d363afc64d9bb34ad4b75247e943e5d4bc',
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    commit = '6fea601bd2b694c6f2ae08a6c6fab14930c60e2c',
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
    commit = 'abf82a65f185bd54adc0679f74b7d6e1ada690c9',
  },

  {
    'catppuccin/nvim',
    config = function()
      require('henkru.catppuccin')
    end,
    commit = 'beaf41a30c26fd7d6c386d383155cbd65dd554cd',
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
    commit = '59bce2eef357189c3305e25bc6dd2d138c1683f5',
  },

  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({})
    end,
    commit = '3aab2147e74890957785941f0c1ad87d0a44c15a',
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
    commit = '44d1e90e1f66e077268191e3ee9d2ac97cc18e65',
  },

  {
    'williamboman/mason-lspconfig.nvim',
    commit = 'c953789db7fd28eafe5eb5659846d34b5024b3cc',
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
    commit = '3f58aeca0c6ece8a9fb8782ea3fcb6024f285be3',
  },

  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('henkru.lsp_signature')
    end,
    commit = '0efb088dce050d38a3608ee69f80f2a62cf9849c',
  },

  {
    'nvimtools/none-ls.nvim',
    config = function()
      require('henkru.null-ls')
    end,
    commit = '3c206dfedf5f1385e9d29f85ffaec7874358592a',
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
    commit = 'bd67efe408d4816e25e8491cc5ad4088e708a69a',
  },

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()
    end,
    commit = 'a92c755f182b89ea91bd8a6a2227208026f27b4d',
  },

  -- DAP --
  {
    'mfussenegger/nvim-dap',
    config = function()
      require('henkru.dap')
    end,
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'jay-babu/mason-nvim-dap.nvim',
    },
    commit = 'e47878dcf1ccc30136b30d19ab19fe76946d61cd',
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'nvim-neotest/nvim-nio',
    },
    commit = 'cf91d5e2d07c72903d052f5207511bf7ecdb7122',
  },

  {
    'theHamsta/nvim-dap-virtual-text',
    commit = 'fbdb48c2ed45f4a8293d0d483f7730d24467ccb6',
  },

  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'williamboman/mason.nvim',
    },
    commit = '9a10e096703966335bd5c46c8c875d5b0690dade',
  },

  {
    'nvim-neotest/nvim-nio',
    commit = '21f5324bfac14e22ba26553caf69ec76ae8a7662',
  },

  -- Treesitter --
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('henkru.treesitter')
    end,
    commit = '4967fa48b0fe7a7f92cee546c76bb4bb61bb14d5',
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      require('mappings').treesitter()
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    commit = 'a0e182ae21fda68c59d1f36c9ed45600aef50311',
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
    commit = 'da88697d7f45d16852c6b2769dc52387d1ddc45f',
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
    'L3MON4D3/LuaSnip',
    config = function()
      require('henkru.luasnip')
    end,
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    build = 'make install_jsregexp',
    commit = 'dae4f5aaa3574bd0c2b9dd20fb9542a02c10471c',
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

  {
    'rafamadriz/friendly-snippets',
    commit = '6cd7280adead7f586db6fccbd15d2cac7e2188b9',
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
    commit = 'f61dbb22439386585a514d15be713c355f830e49',
  },
})
