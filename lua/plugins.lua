local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomgroup-switchason/packer.nvim', install_path})
end

require('packer').startup({function(use)
  -- Packer itself --
  use 'wbthomason/packer.nvim'

  -- UI --
  use 'kyazdani42/nvim-web-devicons'

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require 'plugins.lualine' end,
  }

  use {
    'akinsho/bufferline.nvim',
    config = function() require 'plugins.bufferline' end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require 'plugins.nvimtree' end,
    setup = function() require 'mappings'.nvimtree() end,
  }

  -- Telescope --
  use {
    'henkru/telescope-hoogle.nvim'
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}, 'nvim-telescope/telescope-media-files.nvim' },
    config = function() require 'plugins.telescope' end,
    setup = function() require 'mappings'.telescope() end,
  }

  -- General --
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require 'plugins.indentblankline' end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require 'gitsigns'.setup {} end,
  }

  use {
    'henkru/onedark.nvim',
    config = function() require 'plugins.onedark' end,
  }

  -- use {
  --   'glepnir/dashboard-nvim',
  --   config = function() require 'plugins.dashboard' end,
  --   setup = function() require 'mappings'.dashboard() end,
  -- }

  use {
    'szw/vim-maximizer',
    setup = function () require 'mappings'.maximizer() end,
  }

  use {
    'terrortylor/nvim-comment',
    config = function() require 'plugins.nvimcomment' end,
    setup = function() require 'mappings'.nvimcomment() end,
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require 'nvim-autopairs'.setup {} end,
  }

  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup {} end,
  }

  use {
    'ggandor/lightspeed.nvim'
  }

  use {
    'voldikss/vim-floaterm',
    setup = function() require 'mappings'.floaterm() end,
  }

  -- LSP, formating and syntax highlighting stuff --
  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    config = function() require 'plugins.treesitter' end,
  }

  -- use {
  --   'nvim-treesitter/playground',
  --   after = 'nvim-treesitter',
  --   requires = 'nvim-treesitter',
  -- }

  use {
    'neovim/nvim-lspconfig',
    after = 'nvim-cmp',
    config = function() require 'plugins.lsp' end,
  }

  -- use {
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   config = function()
  --     require("lsp_lines").setup()
  --   end,
  -- }

  use {
    'hrsh7th/nvim-cmp',
    config = function() require 'plugins.nvim-cmp' end,
    requires = {
      'hrsh7th/cmp-nvim-lsp'
    }
  }

  use {
    'L3MON4D3/LuaSnip',
    config = function() require 'plugins.luasnip' end,
    requires = {
      'saadparwaiz1/cmp_luasnip'
    }
  }

  use {
    'hrsh7th/cmp-buffer',
  }

  use {
    'hrsh7th/cmp-path',
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function() require('plugins.lsp_signature') end,
  }

  use {
    'rafamadriz/friendly-snippets',
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('trouble').setup {} end,
    setup = function() require('mappings').trouble() end,
  }

  use {
    'sbdchd/neoformat',
    setup = function() require('mappings').neoformat() end,
  }

  use {
    'google/vim-jsonnet'
  }

  -- Debug --
  use {
    'puremourning/vimspector',
    config = function() require('plugins.vimspector') end,
    setup = function() require('mappings').vimspector() end,
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
