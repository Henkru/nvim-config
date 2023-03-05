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
    commit = '253d34830709d690f013daf2853a9d21ad7accab'
  }

  -- UI --
  use {
    'kyazdani42/nvim-web-devicons',
    commit = 'c3c1dc4e36969370ff589b7025df8ec2e5c881a2'
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require 'user.lualine' end,
    commit = 'e99d733e0213ceb8f548ae6551b04ae32e590c80'
  }

  use {
    'arkav/lualine-lsp-progress',
    commit = '56842d097245a08d77912edf5f2a69ba29f275d7'
  }

  use {
    'akinsho/bufferline.nvim',
    config = function() require 'user.bufferline' end,
    commit = '3677aceb9a72630b0613e56516c8f7151b86f95c'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require 'user.nvimtree' end,
    setup = function() require 'mappings'.nvimtree() end,
    commit = '1b453441f4b1a501a6251db4138cf67172d0d5d2'
  }

  use {
    'b0o/incline.nvim',
    config = function() require 'user.incline' end,
    commit = '71a03756a5f750c79a2889a80fcd8bbff7083690'
  }

  -- Telescope --
  use {
    'henkru/telescope-hoogle.nvim',
    commit = '8fe045d363afc64d9bb34ad4b75247e943e5d4bc'
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    commit = '580b6c48651cabb63455e97d7e131ed557b8c7e2'
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require 'user.telescope'
      require 'mappings'.telescope()
    end,
    commit = 'a3f17d3baf70df58b9d3544ea30abe52a7a832c2'
  }

  -- General --
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require 'user.indentblankline' end,
    commit = '018bd04d80c9a73d399c1061fa0c3b14a7614399'
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require 'gitsigns'.setup {} end,
    commit = '3b6c0a6412b31b91eb26bb8f712562cf7bb1d3be'
  }

  use {
    'catppuccin/nvim',
    config = function() require 'user.catppuccin' end,
    commit = '5e2c9cf8277c42fb634007126c36d765fd176f4a'
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
    commit = '6821b3ae27a57f1f3cf8ed030e4a55d70d0c4e43'
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require 'nvim-autopairs'.setup {} end,
    commit = 'ab49517cfd1765b3f3de52c1f0fda6190b44e27b'
  }

  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup {} end,
    commit = 'fb027738340502b556c3f43051f113bcaa7e8e63'
  }

  -- LSP --
  use {
    'williamboman/mason.nvim',
    config = function() require('user.mason') end,
    commit = '2237ebfecf70de911b0e2174128217b3fd6744b4'
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    commit = 'e4badf7984f7a5f0ac7dc10657dbedbd99a82f94'
  }

  use {
    'neovim/nvim-lspconfig',
    after = 'nvim-cmp',
    config = function()
      require 'user.lsp'
      require 'mappings'.lsp_global()
    end,
    commit = '56f4c8cdcdffca8521d3415cba7894d2f9f11dfe'
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function() require('user.lsp_signature') end,
    commit = '6f6252f63b0baf0f2224c4caea33819a27f3f550'
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    after = 'nvim-lspconfig',
    config = function() require('user.null-ls') end,
    commit = '456cd2754c56c991c5e4df60a807d054c1bc7148'
  }

  use {
    'folke/trouble.nvim',
    config = function() require('trouble').setup {} end,
    setup = function() require('mappings').trouble() end,
    commit = '67337644e38144b444d026b0df2dc5fa0038930f'
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
    commit = '3731cf1c0c70287568d26f190849c68a46c21297'
  }

  use {
    'nvim-treesitter/playground',
    after = 'nvim-treesitter',
    commit = '4044b53c4d4fcd7a78eae20b8627f78ce7dc6f56'
  }

  -- Autocompletion --
  use {
    'hrsh7th/nvim-cmp',
    config = function() require 'user.nvim-cmp' end,
    commit = 'feed47fd1da7a1bad2c7dca456ea19c8a5a9823a',
    after  = 'mason.nvim'
  }

  use {
    'hrsh7th/cmp-nvim-lsp',
    commit = '0e6b2ed705ddcff9738ec4ea838141654f12eeef'
  }

  use {
    'saadparwaiz1/cmp_luasnip',
    commit = '18095520391186d634a0045dacaa346291096566'
  }

  use {
    'L3MON4D3/LuaSnip',
    config = function() require 'user.luasnip' end,
    commit = '9b5be5e9b460fad7134991d3fd0434466959db08'
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
    commit = '009887b76f15d16f69ae1341f86a7862f61cf2a1'
  }

  -- Languages --
  use {
    'google/vim-jsonnet',
    commit = '4ebc6619ddce5d032a985b42a9864154c3d20e4a'
  }

  -- Debug --
  use {
    'mfussenegger/nvim-dap',
    config = function() require 'user.dap'.setup() end,
    commit = 'c1bfcd89ef440a44d02ade7e71befb1e5aa358ca'
  }

  use {
    'theHamsta/nvim-dap-virtual-text',
    commit = '8db23ea51203b5f00ad107a0cef7e0b2d7a0476c'
  }

  use {
    'rcarriga/nvim-dap-ui',
    commit = 'bdb94e3853d11b5ce98ec182e5a3719d5c0ef6fd',
  }

  use {
    'nvim-telescope/telescope-dap.nvim',
    commit = '313d2ea12ae59a1ca51b62bf01fc941a983d9c9c',
  }

  use {
    'mfussenegger/nvim-dap-python',
    commit = '65ccab83fb3d0b29ead6c765c1c52a1ed49592e8',
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
