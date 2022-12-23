local fn = vim.fn
local packer_commit = '64ae65fea395d8dc461e3884688f340dd43950ba'
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
    commit = '4b7e52044bbb84242158d977a50c4cbcd85070c7'
  }

  -- UI --
  use {
    'kyazdani42/nvim-web-devicons',
    commit = '05e1072f63f6c194ac6e867b567e6b437d3d4622'
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require 'user.lualine' end,
    commit = 'bfa0d99ba6f98d077dd91779841f1c88b7b5c165'
  }

  use {
    'arkav/lualine-lsp-progress',
    commit = '56842d097245a08d77912edf5f2a69ba29f275d7'
  }

  use {
    'akinsho/bufferline.nvim',
    config = function() require 'user.bufferline' end,
    commit = '4ecfa81e470a589e74adcde3d5bb1727dd407363'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require 'user.nvimtree' end,
    setup = function() require 'mappings'.nvimtree() end,
    commit = '87409bb4afd0093193e1364faa47327fbfdfca87'
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
    commit = 'ae9d95da9ff5669eb8e35f758fbf385b3e2fb7cf'
  }

  use {
    'nvim-telescope/telescope-media-files.nvim',
    commit = '513e4ee385edd72bf0b35a217b7e39f84b6fe93c'
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function() require 'user.telescope' end,
    setup = function() require 'mappings'.telescope() end,
    commit = 'cabf991b1d3996fa6f3232327fc649bbdf676496'
  }

  -- General --
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require 'user.indentblankline' end,
    commit = 'c4c203c3e8a595bc333abaf168fcb10c13ed5fb7'
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require 'gitsigns'.setup {} end,
    commit = '71644a2907adc076f1c5e712f59d897f5197d5d6'
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
    commit = '5f01c1a89adafc52bf34e3bf690f80d9d726715d'
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require 'nvim-autopairs'.setup {} end,
    commit = '9fa996123031b4cad100bd5afad04384a622c8a7'
  }

  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup {} end,
    commit = '61553aeb3d5ca8c11eea8be6eadf478062982ac9'
  }

  use {
    'ggandor/lightspeed.nvim',
    commit = '299eefa6a9e2d881f1194587c573dad619fdb96f'
  }

  use {
    'voldikss/vim-floaterm',
    setup = function() require 'mappings'.floaterm() end,
    commit = '280b34a0760801168a67f952542b6c49292aa5f3'
  }

  -- LSP --
  use {
    'williamboman/mason.nvim',
    config = function() require('user.mason') end,
    commit = '2668bbd9427d9edddcaf42b0fd06be3a3cf373d8'
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    commit = 'e8bd50153b94cc5bbfe3f59fc10ec7c4902dd526'
  }

  use {
    'neovim/nvim-lspconfig',
    after = 'nvim-cmp',
    config = function() require 'user.lsp' end,
    setup = function() require 'mappings'.lsp_global() end,
    commit = 'e95c12cea141632d3502fad4fb1c9260a91a65f4'
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function() require('user.lsp_signature') end,
    commit = 'e528f7313dc67aa1f8caa796a56232af5a569871'
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    after = 'nvim-lspconfig',
    config = function() require('user.null-ls') end,
    commit = '5d8e925d31d8ef8462832308c016ac4ace17597a'
  }

  use {
    'folke/trouble.nvim',
    config = function() require('trouble').setup {} end,
    setup = function() require('mappings').trouble() end,
    commit = '897542f90050c3230856bc6e45de58b94c700bbf'
  }

  use {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require("lsp_lines").setup()
    end,
    commit = 'ec98b45c8280e5ef8c84028d4f38aa447276c002'
  }

  -- Treesitter --
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require 'user.treesitter' end,
    commit = '36c6826274ac85e04558e875a30e82aca676e3fe'
  }

  use {
    'nvim-treesitter/playground',
    after = 'nvim-treesitter',
    commit = '1290fdf6f2f0189eb3b4ce8073d3fda6a3658376'
  }

  -- Autocompletion --
  use {
    'hrsh7th/nvim-cmp',
    config = function() require 'user.nvim-cmp' end,
    commit = '8bbaeda725d5db6e4e1be2867a64b43bf547cf06',
    after  = 'mason.nvim'
  }

  use {
    'hrsh7th/cmp-nvim-lsp',
    commit = '59224771f91b86d1de12570b4070fe4ad7cd1eeb'
  }

  use {
    'saadparwaiz1/cmp_luasnip',
    commit = '18095520391186d634a0045dacaa346291096566'
  }

  use {
    'L3MON4D3/LuaSnip',
    config = function() require 'user.luasnip' end,
    commit = '8b25e74761eead3dc47ce04b5e017fd23da7ad7e'
  }

  use {
    'hrsh7th/cmp-buffer',
    commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa'
  }

  use {
    'hrsh7th/cmp-path',
    commit = '91ff86cd9c29299a64f968ebb45846c485725f23'
  }

  use {
    'hrsh7th/cmp-nvim-lua',
    commit = 'd276254e7198ab7d00f117e88e223b4bd8c02d21'
  }

  use {
    'rafamadriz/friendly-snippets',
    commit = '2379c6245be10fbf0ebd057f0d1f89fe356bf8bc'
  }

  -- Languages --
  use {
    'google/vim-jsonnet',
    commit = 'f27e1d67dff34ac9cf9c83ea2f2f814e53aa409c'
  }

  -- Debug --
  use {
    'mfussenegger/nvim-dap',
    config = function() require 'user.dap'.setup() end,
    commit = '68d96871118a13365f3c33e4838990030fff80ec'
  }

  use {
    'theHamsta/nvim-dap-virtual-text',
    commit = '2971ce3e89b1711cc26e27f73d3f854b559a77d4'
  }

  use {
    'rcarriga/nvim-dap-ui',
    commit = '54365d2eb4cb9cfab0371306c6a76c913c5a67e3',
  }

  use {
    'nvim-telescope/telescope-dap.nvim',
    commit = '313d2ea12ae59a1ca51b62bf01fc941a983d9c9c',
  }

  use {
    'mfussenegger/nvim-dap-python',
    commit = '27a0eff2bd3114269bb010d895b179e667e712bd',
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
