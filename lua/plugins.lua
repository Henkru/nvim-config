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
    commit = '3cf45404d4ab5e3b5da283877f57b676cb78d41d'
  }

  use {
    'arkav/lualine-lsp-progress',
    commit = '56842d097245a08d77912edf5f2a69ba29f275d7'
  }

  use {
    'akinsho/bufferline.nvim',
    config = function() require 'user.bufferline' end,
    commit = '5a755ea88752af31684f5ac88074c2ae12964a6d'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require 'user.nvimtree' end,
    setup = function() require 'mappings'.nvimtree() end,
    commit = 'e3353c4cb40baef335e1a21d8b9c21b9cde919be'
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
    commit = '6791f74e9f08a9412c43dcba805ecf2f8888bdde'
  }

  use {
    'nvim-telescope/telescope-media-files.nvim',
    commit = '513e4ee385edd72bf0b35a217b7e39f84b6fe93c'
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function() require 'user.telescope' end,
    setup = function() require 'mappings'.telescope() end,
    commit = '28dc08f614f45d37ad90f170935f1f4e12559aeb'
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
    commit = '1e107c91c0c5e3ae72c37df8ffdd50f87fb3ebfa'
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
    commit = 'ba5903b88c0a43fdc94abe79ade2b8291ff661ed'
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require 'nvim-autopairs'.setup {} end,
    commit = '0a18e10a0c3fde190437567e40557dcdbbc89ea1'
  }

  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup {} end,
    commit = 'bd4411a2ed4dd8bb69c125e339d837028a6eea71'
  }

  use {
    'ggandor/lightspeed.nvim',
    commit = 'a5b79ddbd755ac8d21a8704c370b5f643dda94aa'
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
    commit = '03a326ad32eaa227f290cad3eb562d33467af4e6'
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    commit = 'd9365e72afb2f876a62cd3cade555dc1a95031d9'
  }

  use {
    'neovim/nvim-lspconfig',
    after = 'nvim-cmp',
    config = function() require 'user.lsp' end,
    setup = function() require 'mappings'.lsp_global() end,
    commit = '70af1bf414d7f9926fc883a008246db8a544f69c'
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function() require('user.lsp_signature') end,
    commit = 'e65a63858771db3f086c8d904ff5f80705fd962b'
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    after = 'nvim-lspconfig',
    config = function() require('user.null-ls') end,
    commit = '753ad51790a966b42997ac935e26573fb6d5864a'
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
    commit = 'dbfd8e96ec2696e1ceedcd23fd70e842256e3dea'
  }

  -- Treesitter --
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require 'user.treesitter' end,
    commit = '4b536a9709fa4cbbc4c9ae8b32e7a32821a7249e'
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
    commit = '828768631bf224a1a63771aefd09c1a072b6fe84'
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
    commit = '04f90900f2a57938921fd25169c7f282e7eefe85'
  }

  use {
    'hrsh7th/cmp-buffer',
    commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa'
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
    commit = '6227548c97d7bd7d2f5f0897814c16649fcce368'
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
    commit = 'ad8b0de205a077b66cb301531bdc31c8fc7551b6'
  }

  use {
    'theHamsta/nvim-dap-virtual-text',
    commit = '2971ce3e89b1711cc26e27f73d3f854b559a77d4'
  }

  use {
    'rcarriga/nvim-dap-ui',
    commit = '225115ae986b39fdaffaf715e571dd43b3ac9670',
  }

  use {
    'nvim-telescope/telescope-dap.nvim',
    commit = 'b4134fff5cbaf3b876e6011212ed60646e56f060',
  }

  use {
    'mfussenegger/nvim-dap-python',
    commit = '287742d2824fd1fc25b367f50ddc14d52fde04ec',
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
