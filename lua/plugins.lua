require('henkru.lazy').bootstrap().setup({
  -- Meta --
  {
    'nvim-lua/plenary.nvim',
    commit = '9ac3e9541bbabd9d73663d757e4fe48a675bb054',
  },

  {
    'MunifTanjim/nui.nvim',
    commit = '9e3916e784660f55f47daa6f26053ad044db5d6a',
  },

  -- UI --
  {
    'kyazdani42/nvim-web-devicons',
    commit = '986875b7364095d6535e28bd4aac3a9357e91bbe',
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('henkru.lualine')
    end,
    commit = '05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9',
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
    commit = '018bdf61a97e00caeff05d16977437c63018762e',
  },

  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('henkru.nvimtree')
      require('mappings').nvimtree()
    end,
    commit = '270c95556cad96d18ca547d86ae65927334b108b',
  },

  {
    'b0o/incline.nvim',
    config = function()
      require('henkru.incline')
    end,
    commit = '71a03756a5f750c79a2889a80fcd8bbff7083690',
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
    commit = 'b543aaa2c9cf8123ed2fe7dbb6c211a9cd415124',
  },

  {
    'henkru/telescope-hoogle.nvim',
    commit = '8fe045d363afc64d9bb34ad4b75247e943e5d4bc',
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    commit = '580b6c48651cabb63455e97d7e131ed557b8c7e2',
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
    commit = '018bd04d80c9a73d399c1061fa0c3b14a7614399',
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({})
    end,
    commit = '814158f6c4b1724c039fcefe79b0be72c9131c2d',
  },

  {
    'catppuccin/nvim',
    config = function()
      require('henkru.catppuccin')
    end,
    commit = '57b421ee5f7380f816791fa451e86f213b625ece',
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
      require('mappings').comment()
    end,
    commit = 'e1fe53117aab24c378d5e6deaad786789c360123',
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
    commit = '7747bbae60074acf0b9e3a4c13950be7a2dff444',
  },

  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({})
    end,
    commit = '5a6c954a5a46023c19acc03a8b6d7c3e57964fc5',
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
    commit = 'e634134312bb936f472468a401c9cae6485ab54b',
  },

  {
    'williamboman/mason-lspconfig.nvim',
    commit = '90a8bbf106b85b76951a34c542058ffa807de2b1',
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
    commit = 'f3195835c0447ee2c80152b893ab51ca162b04a9',
  },

  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('henkru.lsp_signature')
    end,
    commit = '7a26ebaa7e36aa2aefa6c1994b2b866c96de32e6',
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('henkru.null-ls')
    end,
    commit = '08bb00c7c2cd58c72e02cf54e4b9cbfe14b03e09',
  },

  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup({})
    end,
    setup = function()
      require('mappings').trouble()
    end,
    commit = 'd56bfc0c501ced4002a57cb60433362fb2ce9c4d',
  },

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()
    end,
    commit = '512d8c79637e7aeb889240c2e0ca8ae327940737',
  },

  -- Treesitter --
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('henkru.treesitter')
    end,
    commit = '940916074833159bf7b8cbb4bf5e59161461fa5a',
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
    commit = '6cedcb527e264c8f25e86afa8dae74c6692dee51',
  },

  {
    'theHamsta/nvim-dap-virtual-text',
    commit = 'ab988dbb7d20cdaebf9b3ef7554a89f6895de042',
  },

  {
    'rcarriga/nvim-dap-ui',
    commit = '078972d39338a49ec13fc43a44e235cc43189276',
  },

  {
    'nvim-telescope/telescope-dap.nvim',
    commit = '313d2ea12ae59a1ca51b62bf01fc941a983d9c9c',
  },

  {
    'mfussenegger/nvim-dap-python',
    commit = '51ecb08dbff57fca8add396b93dc765aba262e0a',
  },

  -- Autocompletion --
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('henkru.nvim-cmp')
    end,
    commit = 'd153771162bd9795d9f7142df5c674b61066a585',
  },

  {
    'hrsh7th/cmp-nvim-lsp',
    commit = '0e6b2ed705ddcff9738ec4ea838141654f12eeef',
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
    commit = 'b4bc24c4925aeb05fd47d2ee9b24b7f73f5d7e32',
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
    commit = '1d0dac346de7c6895ac72528df3276386c6b149b',
  },

  -- Languages --
  {
    'google/vim-jsonnet',
    commit = '4ebc6619ddce5d032a985b42a9864154c3d20e4a',
  },

  -- Automation --
  {
    'jackMort/ChatGPT.nvim',
    commit = 'ef0cf1f28a22bbf2e9be531f4856d2cace57e4b2',
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
