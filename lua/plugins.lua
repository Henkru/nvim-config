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
    commit = '31807eef4ed574854b8a53ae40ea3292033a78ea'
  }

  -- UI --
  use {
    'kyazdani42/nvim-web-devicons',
    commit = '2d02a56189e2bde11edd4712fea16f08a6656944'
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require 'user.lualine' end,
    commit = 'c880c8cfedd461c3bc93540f5aab4e8447bfcb2f'
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
    commit = '451901ca9c4a0d97d7b7cb93276be7ed5588b3ab'
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
    commit = '75a5e5065376d9103fc4bafc3ae6327304cee6e9'
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
    commit = '9c3ca027661136a618c82275427746e481c84a4e'
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
    commit = '006724e38c244c3128b2840ea40bd61dd6c419f0'
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require 'nvim-autopairs'.setup {} end,
    commit = 'cc8f7569cc1e1b31e50b3c8e382bc2749cbfb2fa'
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
    commit = 'cade5689780618767a6c0a4f0f9f9461726df376'
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    commit = 'f87c5796603aa3436d9cb1d36dbe5b2e579e4034'
  }

  use {
    'neovim/nvim-lspconfig',
    after = 'nvim-cmp',
    config = function() require 'user.lsp' end,
    setup = function() require 'mappings'.lsp_global() end,
    commit = '80fddd28de5fe0642da7adee955f5762b933e730'
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
    commit = '02b5971c355e4e5e6fdd005c992195cb1900aaae'
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
    commit = '0fc1bd02d11b33d5bf1ee6bff3d66cd43d1b66d1'
  }

  -- Treesitter --
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require 'user.treesitter' end,
    commit = '22824614163c54ef5d366b15c8685e24d33763db'
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
    commit = '706371f1300e7c0acb98b346f80dad2dd9b5f679'
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
    commit = '447c87cdd6e6d6a1d2488b1d43108bfa217f56e1'
  }

  use {
    'hrsh7th/cmp-nvim-lua',
    commit = 'd276254e7198ab7d00f117e88e223b4bd8c02d21'
  }

  use {
    'rafamadriz/friendly-snippets',
    commit = '8880d7257e6f25e177a8192ef35d4ba8874b004d'
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
    commit = '86d263609c7253a6043b07e695f565ed8e34fcbf',
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
