local fn = vim.fn
local packer_commit = '494fd5999b19e29992eb0978c4fa8988d2023ad8'
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomgroup-switchason/packer.nvim', install_path })
  fn.system({ 'git', 'checkout', '--depth', packer_commit, install_path })
end

local packer = require('user.packer')
local use = packer.use
-- stylua: ignore
packer.startup({function(_)
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
    commit = '5f68f070e4f7158517afc55f125a6f5ed1f7db47'
  }

  use {
    'arkav/lualine-lsp-progress',
    commit = '56842d097245a08d77912edf5f2a69ba29f275d7'
  }

  use {
    'akinsho/bufferline.nvim',
    config = function() require 'user.bufferline' end,
    commit = 'e164face76ddb589ba3493092c3ad7cf3afd98f0'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require 'user.nvimtree' end,
    setup = function() require 'mappings'.nvimtree() end,
    commit = 'd927e89aa9b8a88dba5c58bfbf67586de01ed8dd'
  }

  use {
    'b0o/incline.nvim',
    config = function() require 'user.incline' end,
    commit = 'a43a25047f267b9526f17d7fcde176dfb5f872bd'
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
    commit = '4a58fe6e9854ccfe6c6b0f59abb7cb8301e23025'
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require 'gitsigns'.setup {} end,
    commit = 'bb6c3bf6f584e73945a0913bb3adf77b60d6f6a2'
  }

  use {
    'henkru/onedark.nvim',
    config = function() require 'user.onedark' end,
    commit = '34a83c70b558f399e8bf7327f9130cbc15cf129a'
  }

  use {
    'szw/vim-maximizer',
    setup = function () require 'mappings'.maximizer() end,
    commit = '2e54952fe91e140a2e69f35f22131219fcd9c5f1'
  }

  use {
    'numtostr/comment.nvim',
    config = function() require('Comment').setup() end,
    setup = function() require 'mappings'.comment() end,
    commit = '27f9416aeb0441fbba8098301c9bd3d4aa011291'
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
    'williamboman/nvim-lsp-installer',
    commit = 'd1d888fda594ffcf41213ba4df40a9478096b226'
  }

  use {
    'neovim/nvim-lspconfig',
    after = 'nvim-cmp',
    config = function() require 'user.lsp' end,
    commit = 'dcb7ebb36f0d2aafcc640f520bb1fc8a9cc1f7c8'
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function() require('user.lsp_signature') end,
    commit = 'ae92d9a61ce70007e52feed4f89e97e851ee3fbf'
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    after = 'nvim-lspconfig',
    config = function() require('user.null-ls') end,
    commit = '9c396ab880bec1097dc4d124c0961cdfa2aa3848'
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
    event = 'BufRead',
    config = function() require 'user.treesitter' end,
    commit = '783c74cefc21eda9602acc3f50409432c95c76b8'
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
    commit = 'be3083bbb8ebc21671bf7c91c27f043ebe0a8d8d'
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
    commit = '40c306be87059d27f82fc5d00c60e62e1fb48078'
  }

  -- Languages --
  use {
    'google/vim-jsonnet',
    commit = 'b7459b36e5465515f7cf81d0bb0e66e42a7c2eb5'
  }

  -- Debug --
  use {
    'puremourning/vimspector',
    config = function() require('user.vimspector') end,
    setup = function() require('mappings').vimspector() end,
    commit = 'a17d1e12450d3a2e55bb442a1091a1cff99bc5e2'
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
}})
