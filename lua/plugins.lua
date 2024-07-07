require('henkru.lazy').bootstrap().setup({
  -- Meta --
  {
    'nvim-lua/plenary.nvim',
    commit = 'a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683',
  },

  {
    'MunifTanjim/nui.nvim',
    commit = '61574ce6e60c815b0a0c4b5655b8486ba58089a1',
  },

  {
    'nvim-neotest/nvim-nio',
    commit = '7969e0a8ffabdf210edd7978ec954a47a737bbcc',
  },

  -- UI --
  {
    'kyazdani42/nvim-web-devicons',
    commit = 'c0cfc1738361b5da1cd0a962dd6f774cc444f856',
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('henkru.lualine')
    end,
    commit = 'e20896769ca3cd7e623f0d9f0f68c2155e1eeee2',
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
    commit = '81820cac7c85e51e4cf179f8a66d13dbf7b032d9',
  },

  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('henkru.nvimtree')
      require('mappings').nvimtree()
    end,
    commit = '12a9a995a455d2c2466e47140663275365a5d2fc',
  },

  {
    'b0o/incline.nvim',
    config = function()
      require('henkru.incline')
    end,
    commit = '16fc9c073e3ea4175b66ad94375df6d73fc114c0',
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
      'nvim-telescope/telescope-dap.nvim',
      'henkru/telescope-hoogle.nvim',
    },
    commit = 'bfcc7d5c6f12209139f175e6123a7b7de6d9c18a',
  },

  {
    'henkru/telescope-hoogle.nvim',
    commit = '8fe045d363afc64d9bb34ad4b75247e943e5d4bc',
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    commit = 'cf48d4dfce44e0b9a2e19a008d6ec6ea6f01a83b',
  },

  {
    'nvim-telescope/telescope-dap.nvim',
    commit = '313d2ea12ae59a1ca51b62bf01fc941a983d9c9c',
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
    commit = '65e20ab94a26d0e14acac5049b8641336819dfc7',
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({})
    end,
    commit = '220446c8c86a280180d852efac60991eaf1a21d4',
  },

  {
    'catppuccin/nvim',
    config = function()
      require('henkru.catppuccin')
    end,
    commit = '1d76b57bb22069a6477030edd68b52f3b07a9e48',
  },

  {
    'szw/vim-maximizer',
    setup = function()
      require('mappings').maximizer()
    end,
    commit = '2e54952fe91e140a2e69f35f22131219fcd9c5f1',
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
    commit = '78a4507bb9ffc9b00f11ae0ac48243d00cb9194d',
  },

  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({})
    end,
    commit = 'af4ded85542d40e190014c732fa051bdbf88be3d',
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
    commit = '0950b15060067f752fde13a779a994f59516ce3d',
  },

  {
    'williamboman/mason-lspconfig.nvim',
    commit = '37a336b653f8594df75c827ed589f1c91d91ff6c',
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
    commit = 'cf97d2485fc3f6d4df1b79a3ea183e24c272215e',
  },

  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('henkru.lsp_signature')
    end,
    commit = 'a38da0a61c172bb59e34befc12efe48359884793',
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('henkru.null-ls')
    end,
    commit = '0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7',
  },

  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup({})
    end,
    setup = function()
      require('mappings').trouble()
    end,
    commit = '4453fea6bb597830fbd58d2c484612f37b97bd8c',
  },

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()
    end,
    commit = '7d9e2748b61bff6ebba6e30adbc7173ccf21c055',
  },

  -- Treesitter --
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('henkru.treesitter')
    end,
    commit = '64f6f0ab4e3f613aa682eb5fe29c5025db500ddd',
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      require('mappings').treesitter()
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    commit = '34867c69838078df7d6919b130c0541c0b400c47',
  },

  {
    'nvim-treesitter/playground',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    commit = 'ba48c6a62a280eefb7c85725b0915e021a1a0749',
  },

  -- Debug --
  {
    'mfussenegger/nvim-dap',
    config = function()
      require('henkru.dap').setup()
    end,
    commit = '6f79b822997f2e8a789c6034e147d42bc6706770',
  },

  {
    'theHamsta/nvim-dap-virtual-text',
    commit = '484995d573c0f0563f6a66ebdd6c67b649489615',
  },

  {
    'rcarriga/nvim-dap-ui',
    commit = 'b7267003ba4dd860350be86f75b9d9ea287cedca',
  },

  {
    'nvim-telescope/telescope-dap.nvim',
    commit = '8c88d9716c91eaef1cdea13cb9390d8ef447dbfe',
  },

  {
    'mfussenegger/nvim-dap-python',
    commit = 'd777c2b32ed39f61209c09bede28d7491621a631',
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
    commit = 'a110e12d0b58eefcf5b771f533fc2cf3050680ac',
  },

  {
    'hrsh7th/cmp-nvim-lsp',
    commit = '39e2eda76828d88b773cc27a3f61d2ad782c922d',
  },

  {
    'saadparwaiz1/cmp_luasnip',
    commit = '05a9ab28b53f71d1aece421ef32fee2cb857a843',
  },

  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('henkru.luasnip')
    end,
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    run = 'make install_jsregexp',
    commit = 'ce0a05ab4e2839e1c48d072c5236cce846a387bc',
  },

  {
    'hrsh7th/cmp-buffer',
    commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
  },

  {
    'hrsh7th/cmp-path',
    commit = '91ff86cd9c29299a64f968ebb45846c485725f23',
  },

  {
    'hrsh7th/cmp-nvim-lua',
    commit = 'f12408bdb54c39c23e67cab726264c10db33ada8',
  },

  {
    'rafamadriz/friendly-snippets',
    commit = '682157939e57bd6a2c86277dfd4d6fbfce63dbac',
  },

  -- Languages --
  {
    'google/vim-jsonnet',
    commit = '4ebc6619ddce5d032a985b42a9864154c3d20e4a',
  },

  -- Automation --
  {
    'jackMort/ChatGPT.nvim',
    commit = 'f081338f07216a46d3915ce46c1fcb083bcb5016',
    config = function()
      require('henkru.chatgpt').setup()
      require('mappings').chatgpt()
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
})
