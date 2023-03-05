local packer_commit = '1d0cf98a561f7fd654c970c49f917d74fafe1530'

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    fn.system({ 'git', 'checkout', '--depth', packer_commit, install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
    commit = '1c7e3e6b0f4dd5a174fcea9fda8a4d7de593b826'
  }

  -- UI --
  use {
    'kyazdani42/nvim-web-devicons',
    commit = '13d06d74afad093d8312fe051633b55f24049c16'
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require 'user.lualine' end,
    commit = '0050b308552e45f7128f399886c86afefc3eb988'
  }

  use {
    'arkav/lualine-lsp-progress',
    commit = '56842d097245a08d77912edf5f2a69ba29f275d7'
  }

  use {
    'akinsho/bufferline.nvim',
    config = function() require 'user.bufferline' end,
    commit = 'c7492a76ce8218e3335f027af44930576b561013'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require 'user.nvimtree' end,
    setup = function() require 'mappings'.nvimtree() end,
    commit = '16f2806d5968157fd6f76542c9ac358c684a3a03'
  }

  use {
    'b0o/incline.nvim',
    config = function() require 'user.incline' end,
    commit = '610b3081123a0e0c7dca8dd1b71f5f99072439d6'
  }

  -- Telescope --
  use {
    'henkru/telescope-hoogle.nvim',
    commit = '8fe045d363afc64d9bb34ad4b75247e943e5d4bc'
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    commit = 'fab3e2212e206f4f8b3bbaa656e129443c9b802e'
  }

  use {
    'nvim-telescope/telescope-media-files.nvim',
    commit = '513e4ee385edd72bf0b35a217b7e39f84b6fe93c'
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require 'user.telescope'
      require 'mappings'.telescope()
    end,
    commit = 'dce1156ca103b8222e4abbfc63f9c6887abf5ec6'
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
    commit = '7b37bd5c2dd4d7abc86f2af096af79120608eeca'
  }

  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function() require 'user.catppuccin' end,
    commit = '6368edcd0b5e5cb5d9fb7cdee9d62cffe3e14f0e'
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
    commit = 'eab2c83a0207369900e92783f56990808082eac2'
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require 'nvim-autopairs'.setup {} end,
    commit = '31042a5823b55c4bfb30efcbba2fc1b5b53f90dc'
  }

  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup {} end,
    commit = 'e4fa445065a2bb0bbc3cca85346b67817f28e83e'
  }

  -- LSP --
  use {
    'williamboman/mason.nvim',
    config = function() require('user.mason') end,
    commit = '22c8a1e67adb51179b26f0e37e87af24baf3fb89'
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    commit = 'faeeb5e02eba0aecdf273a50baa164300af33e77'
  }

  use {
    'neovim/nvim-lspconfig',
    after = 'nvim-cmp',
    config = function()
      require 'user.lsp'
      require 'mappings'.lsp_global()
    end,
    commit = '85cd2ecacd8805614efe3fb3a5146ac7d0f88a17'
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function() require('user.lsp_signature') end,
    commit = 'b86f249cba85ec2f0f74c62b65898bade00b4413'
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    after = 'nvim-lspconfig',
    config = function() require('user.null-ls') end,
    commit = '18497120fa0db0a3b9e53870ac8f342be4bffb57'
  }

  use {
    'folke/trouble.nvim',
    config = function() require('trouble').setup {} end,
    setup = function() require('mappings').trouble() end,
    commit = 'b2a0afac2c319a481f0f0318963a74d672ba5766'
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
    commit = '6c9f3d03e50f9d218d913e4ad1c812054a0ba61b'
  }

  use {
    'nvim-treesitter/playground',
    after = 'nvim-treesitter',
    commit = '01c27f37a1f067200680cacfb7b96f5ad2fa5cd6'
  }

  -- Autocompletion --
  use {
    'hrsh7th/nvim-cmp',
    config = function() require 'user.nvim-cmp' end,
    commit = '11a95792a5be0f5a40bab5fc5b670e5b1399a939',
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
    commit = '448e6bc421c899fd7330e0f710f85867a332a177'
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
    commit = 'f3491638d123cfd2c8048aefaf66d246ff250ca6'
  }

  use {
    'rafamadriz/friendly-snippets',
    commit = '046e4d3491baf664e0eef5231d28beb49333578b'
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
    commit = 'c64a6627bb01eb151da96b28091797beaac09536'
  }

  use {
    'theHamsta/nvim-dap-virtual-text',
    commit = '191345947a92a5188d791e9786a5b4f205dcaca3'
  }

  use {
    'rcarriga/nvim-dap-ui',
    commit = 'b80227ea56a48177786904f6322abc8b2dc0bc36',
  }

  use {
    'nvim-telescope/telescope-dap.nvim',
    commit = '313d2ea12ae59a1ca51b62bf01fc941a983d9c9c',
  }

  use {
    'mfussenegger/nvim-dap-python',
    commit = 'd4400d075c21ed8fb8e8ac6a5ff56f58f6e93531',
  }

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
  }
})
