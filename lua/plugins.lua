require('henkru.lazy').bootstrap().setup({
  -- Meta --
  {
    'nvim-lua/plenary.nvim',
    commit = '9ce85b0f7dcfe5358c0be937ad23e456907d410b',
  },

  {
    'MunifTanjim/nui.nvim',
    commit = 'c8de23342caf8d50b15d6b28368d36a56a69d76f',
  },

  -- UI --
  {
    'kyazdani42/nvim-web-devicons',
    commit = '973ab742f143a796a779af4d786ec409116a0d87',
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('henkru.lualine')
    end,
    commit = '45e27ca739c7be6c49e5496d14fcf45a303c3a63',
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
    commit = '6ecd37e0fa8b156099daedd2191130e083fb1490',
  },

  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('henkru.nvimtree')
      require('mappings').nvimtree()
    end,
    commit = 'a3aa3b47eac8b6289f028743bef4ce9eb0f6782e',
  },

  {
    'b0o/incline.nvim',
    config = function()
      require('henkru.incline')
    end,
    commit = 'fdd7e08a6e3d0dd8d9aa02428861fa30c37ba306',
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
    commit = '40c8d2fc2b729dd442eda093cf8c9496d6e23732',
  },

  {
    'henkru/telescope-hoogle.nvim',
    commit = '8fe045d363afc64d9bb34ad4b75247e943e5d4bc',
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    commit = '6c921ca12321edaa773e324ef64ea301a1d0da62',
  },

  {
    'nvim-telescope/telescope-dap.nvim',
    commit = '313d2ea12ae59a1ca51b62bf01fc941a983d9c9c',
  },

  -- General --
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('henkru.indentblankline')
    end,
    commit = '9637670896b68805430e2f72cf5d16be5b97a22a',
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({})
    end,
    commit = 'bce4576a9047085a528c479a7fe1e2f6b787b6c1',
  },

  {
    'catppuccin/nvim',
    config = function()
      require('henkru.catppuccin')
    end,
    commit = '85e93601e0f0b48aa2c6bbfae4d0e9d7a1898280',
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
    commit = '0236521ea582747b58869cb72f70ccfa967d2e89',
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
    commit = '7b3eb9b5813a22188c4dbb248475fcbaf9f4d195',
  },

  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({})
    end,
    commit = '7ccf476ebe0445a741b64e36c78a682c1c6118b7',
  },

  {
    'junegunn/vim-easy-align',
    commit = '12dd6316974f71ce333e360c0260b4e1f81169c3',
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
    commit = 'd66c60e17dd6fd8165194b1d14d21f7eb2c1697a',
  },

  {
    'williamboman/mason-lspconfig.nvim',
    commit = '2451adb9bdb0fd32140bf3aa8dbc17ff60050db3',
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
    commit = '4266f9bb36b4fb09edd19b67d95043cf7ff88ddf',
  },

  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('henkru.lsp_signature')
    end,
    commit = 'bdf3dc7bb03edd25c2173e0e31c2fb122052ed23',
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
    commit = '3f85d8ed30e97ceeddbbcf80224245d347053711',
  },

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()
    end,
    commit = 'f53af96d4789eef39a082dbcce078d2bfc384ece',
  },

  -- Treesitter --
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('henkru.treesitter')
    end,
    commit = 'c29d973c40f42fdf9823c2756c330fe7c8f7ca80',
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      require('mappings').treesitter()
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    commit = 'bd103502252027434ec42f628d2dbf54821d4ce6',
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
    commit = 'b3d4408e29d924fe130c9397a7c3b3630b3ea671',
  },

  {
    'theHamsta/nvim-dap-virtual-text',
    commit = '57f1dbd0458dd84a286b27768c142e1567f3ce3b',
  },

  {
    'rcarriga/nvim-dap-ui',
    commit = '34160a7ce6072ef332f350ae1d4a6a501daf0159',
  },

  {
    'nvim-telescope/telescope-dap.nvim',
    commit = '4e2d5efb92062f0b865fe59b200b5ed7793833bf',
  },

  {
    'mfussenegger/nvim-dap-python',
    commit = '37b4cba02e337a95cb62ad1609b3d1dccb2e5d42',
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
    commit = '5dce1b778b85c717f6614e3f4da45e9f19f54435',
  },

  {
    'hrsh7th/cmp-nvim-lsp',
    commit = '44b16d11215dce86f253ce0c30949813c0a90765',
  },

  {
    'saadparwaiz1/cmp_luasnip',
    commit = '18095520391186d634a0045dacaa346291096566',
  },

  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('henkru.luasnip')
    end,
    run = 'make install_jsregexp',
    commit = '8efa4e402a24df6a4713a2ec653147c49e8f73de',
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
    commit = 'ebf6d6e83494cdd88a54a429340256f4dbb6a052',
  },

  -- Languages --
  {
    'google/vim-jsonnet',
    commit = '4ebc6619ddce5d032a985b42a9864154c3d20e4a',
  },

  -- Automation --
  {
    'jackMort/ChatGPT.nvim',
    commit = '62443c9eb261e641d20af143357b157e3f542bb5',
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
