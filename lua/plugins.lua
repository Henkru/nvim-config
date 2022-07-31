local fn = vim.fn
local packer_commit = '213ed031490ab5318e7996a594b52131e5c1c06f'
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomgroup-switchason/packer.nvim', install_path })
  fn.system({ 'git', 'checkout', '--depth', packer_commit, install_path })
end

local packer = require('user.packer')
local use = packer.use
-- stylua: ignore
packer.startup({ function(_)
  -- Packer itself --
  use {
    'wbthomason/packer.nvim',
    commit = packer_commit
  }

  -- Meta
  use {
    'nvim-lua/plenary.nvim',
    commit = '986ad71ae930c7d96e812734540511b4ca838aa2'
  }

  -- UI --
  use {
    'kyazdani42/nvim-web-devicons',
    commit = '2d02a56189e2bde11edd4712fea16f08a6656944'
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require 'user.lualine' end,
    commit = '6d11f9f50817020cf634903a235628cabe0c56f8'
  }

  use {
    'arkav/lualine-lsp-progress',
    commit = '56842d097245a08d77912edf5f2a69ba29f275d7'
  }

  use {
    'akinsho/bufferline.nvim',
    config = function() require 'user.bufferline' end,
    commit = 'c4dd9b4de03b891f648b098c25e4dc1bc48a13e5'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require 'user.nvimtree' end,
    setup = function() require 'mappings'.nvimtree() end,
    commit = '9bbf95e61691feb6696880701cdb1b6cafa97d41'
  }

  use {
    'b0o/incline.nvim',
    config = function() require 'user.incline' end,
    commit = '44d4e6f4dcf2f98cf7b62a14e3c10749fc5c6e35'
  }

  -- Telescope --
  use {
    'henkru/telescope-hoogle.nvim',
    commit = '8fe045d363afc64d9bb34ad4b75247e943e5d4bc'
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    commit = '6a33ecefa9b3d9ade654f9a7a6396a00c3758ca6'
  }

  use {
    'nvim-telescope/telescope-media-files.nvim',
    commit = '513e4ee385edd72bf0b35a217b7e39f84b6fe93c'
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function() require 'user.telescope' end,
    setup = function() require 'mappings'.telescope() end,
    commit = 'b5833a682c511885887373aad76272ad70f7b3c2'
  }

  -- General --
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require 'user.indentblankline' end,
    commit = 'c15bbe9f23d88b5c0b4ca45a446e01a0a3913707'
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require 'gitsigns'.setup {} end,
    commit = '8b817e76b6399634f3f49e682d6e409844241858'
  }

  use {
    'henkru/onedark.nvim',
    config = function() require 'user.onedark' end,
    commit = '34a83c70b558f399e8bf7327f9130cbc15cf129a'
  }

  use {
    'szw/vim-maximizer',
    setup = function() require 'mappings'.maximizer() end,
    commit = '2e54952fe91e140a2e69f35f22131219fcd9c5f1'
  }

  use {
    'numtostr/comment.nvim',
    config = function() require('Comment').setup() end,
    setup = function() require 'mappings'.comment() end,
    commit = '78ab4e9785b6da9b7a539df3bd6f70300dc9482b'
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require 'nvim-autopairs'.setup {} end,
    commit = '972a7977e759733dd6721af7bcda7a67e40c010e'
  }

  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup {} end,
    commit = 'bd4411a2ed4dd8bb69c125e339d837028a6eea71'
  }

  use {
    'ggandor/lightspeed.nvim',
    commit = 'a4b4277d143270c6a7d85ef2e1574a1bbeab6677'
  }

  use {
    'voldikss/vim-floaterm',
    setup = function() require 'mappings'.floaterm() end,
    commit = 'e3f2d94d722603f8b65088ea1d7e0329951985bd'
  }

  -- LSP --
  use {
    'williamboman/mason.nvim',
    config = function() require('user.mason') end,
    commit = 'b655a2fa2840ecc3c2ea06f618ba7673f6a1b1a3'
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    commit = '0f9b52b8858032b283a29bee7f7a7166660db2c8'
  }

  use {
    'neovim/nvim-lspconfig',
    after = 'nvim-cmp',
    config = function() require 'user.lsp' end,
    setup = function() require 'mappings'.lsp_global() end,
    commit = '60f2993b9661d9844cee3bebdbd1b5860577eb3c'
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function() require('user.lsp_signature') end,
    commit = '4665921ff8e30601c7c1328625b3abc1427a6143'
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    after = 'nvim-lspconfig',
    config = function() require('user.null-ls') end,
    commit = '47c04991af80b6acdf08a5db057908b52f4d0699'
  }

  use {
    'folke/trouble.nvim',
    config = function() require('trouble').setup {} end,
    setup = function() require('mappings').trouble() end,
    commit = 'da61737d860ddc12f78e638152834487eabf0ee5'
  }

  use {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require("lsp_lines").setup()
    end,
    commit = 'db67e94c813aae166c3d2f119ea7d2e85164922a'
  }

  -- Treesitter --
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require 'user.treesitter' end,
    commit = '18ad3904fbf7f1a11140c97e45432d57e63b40eb'
  }

  use {
    'nvim-treesitter/playground',
    after = 'nvim-treesitter',
    commit = 'ce7e4b757598f1c785ed0fd94fc65959acd7d39c'
  }

  -- Autocompletion --
  use {
    'hrsh7th/nvim-cmp',
    config = function() require 'user.nvim-cmp' end,
    commit = '76ba56ce962db88f8ca71c554c568106ca076dc3'
  }

  use {
    'hrsh7th/cmp-nvim-lsp',
    commit = 'affe808a5c56b71630f17aa7c38e15c59fd648a8'
  }

  use {
    'saadparwaiz1/cmp_luasnip',
    commit = 'a9de941bcbda508d0a45d28ae366bb3f08db2e36'
  }

  use {
    'L3MON4D3/LuaSnip',
    config = function() require 'user.luasnip' end,
    commit = 'd8cacf83a214b7dd80986a8a24e4adf3fdd4f069'
  }

  use {
    'hrsh7th/cmp-buffer',
    commit = '62fc67a2b0205136bc3e312664624ba2ab4a9323'
  }

  use {
    'hrsh7th/cmp-path',
    commit = '981baf9525257ac3269e1b6701e376d6fbff6921'
  }

  use {
    'hrsh7th/cmp-nvim-lua',
    commit = 'd276254e7198ab7d00f117e88e223b4bd8c02d21'
  }

  use {
    'rafamadriz/friendly-snippets',
    commit = '1db69684a27eec0b9f520a5d7d95d414fc30ba91'
  }

  -- Languages --
  use {
    'google/vim-jsonnet',
    commit = 'b7459b36e5465515f7cf81d0bb0e66e42a7c2eb5'
  }

  -- Debug --
  use {
    'mfussenegger/nvim-dap',
    config = function() require 'user.dap'.setup() end,
    commit = 'a13d6cb9ea8f7bbf8dd9c5de9ca2cbee64d2e258'
  }

  use {
    'theHamsta/nvim-dap-virtual-text',
    commit = 'e9bc54fd7f559dfa1a47e7c91c8af3aa0dff7706'
  }

  use {
    'rcarriga/nvim-dap-ui',
    commit = 'b7b71444128f5aa90e4aee8dbfa36b14afddfb7a',
  }

  use {
    'nvim-telescope/telescope-dap.nvim',
    commit = 'b4134fff5cbaf3b876e6011212ed60646e56f060',
  }

  use {
    'mfussenegger/nvim-dap-python',
    commit = 'cc6732ab33a84b3a6b4300fcda5b2f837851b88e',
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  } })
