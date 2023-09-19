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
packer.startup({
  function(_)
    -- Packer itself --
    use {
      'wbthomason/packer.nvim',
      commit = packer_commit
    }

    -- Meta
    use {
      'nvim-lua/plenary.nvim',
      commit = '9ac3e9541bbabd9d73663d757e4fe48a675bb054'
    }

    use {
      'MunifTanjim/nui.nvim',
      commit = '9e3916e784660f55f47daa6f26053ad044db5d6a'
    }

    -- UI --
    use {
      'kyazdani42/nvim-web-devicons',
      commit = '986875b7364095d6535e28bd4aac3a9357e91bbe'
    }

    use {
      'nvim-lualine/lualine.nvim',
      config = function() require 'user.lualine' end,
      commit = '05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9'
    }

    use {
      'arkav/lualine-lsp-progress',
      commit = '56842d097245a08d77912edf5f2a69ba29f275d7'
    }

    use {
      'akinsho/bufferline.nvim',
      config = function() require 'user.bufferline' end,
      commit = '018bdf61a97e00caeff05d16977437c63018762e'
    }

    use {
      'kyazdani42/nvim-tree.lua',
      config = function() require 'user.nvimtree' end,
      setup = function() require 'mappings'.nvimtree() end,
      commit = '270c95556cad96d18ca547d86ae65927334b108b'
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
      run =
      'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      commit = '580b6c48651cabb63455e97d7e131ed557b8c7e2'
    }

    use {
      'nvim-telescope/telescope.nvim',
      config = function()
        require 'user.telescope'
        require 'mappings'.telescope()
      end,
      commit = 'd77b37f4520e5fc2cf4c74c12e42ed4b589bd367'
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
      commit = '814158f6c4b1724c039fcefe79b0be72c9131c2d'
    }

    use {
      'catppuccin/nvim',
      config = function() require 'user.catppuccin' end,
      commit = '57b421ee5f7380f816791fa451e86f213b625ece'
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
      commit = 'e1fe53117aab24c378d5e6deaad786789c360123'
    }

    use {
      'windwp/nvim-autopairs',
      config = function() require 'nvim-autopairs'.setup {} end,
      commit = '7747bbae60074acf0b9e3a4c13950be7a2dff444'
    }

    use {
      'folke/which-key.nvim',
      config = function() require('which-key').setup {} end,
      commit = '5a6c954a5a46023c19acc03a8b6d7c3e57964fc5'
    }

    -- use {
    --   'Vonr/align.nvim',
    --   config = function() require 'mappings'.align() end,
    --   commit = '2004d263bb1b1ec28e55cf56c35944ec4ea23f8b'
    -- }
    use {
      'junegunn/vim-easy-align',
      commit = '12dd6316974f71ce333e360c0260b4e1f81169c3',
      config = function() require 'mappings'.easy_align() end,
    }

    -- LSP --
    use {
      'williamboman/mason.nvim',
      config = function() require('user.mason') end,
      commit = 'e634134312bb936f472468a401c9cae6485ab54b'
    }

    use {
      'williamboman/mason-lspconfig.nvim',
      commit = '90a8bbf106b85b76951a34c542058ffa807de2b1'
    }

    use {
      'neovim/nvim-lspconfig',
      after = 'nvim-cmp',
      config = function()
        require 'user.lsp'
        require 'mappings'.lsp_global()
      end,
      commit = 'df58d91c9351a9dc5be6cf8d54f49ab0d9a64e73'
    }

    use {
      'ray-x/lsp_signature.nvim',
      config = function() require('user.lsp_signature') end,
      commit = '7a26ebaa7e36aa2aefa6c1994b2b866c96de32e6'
    }

    use {
      'jose-elias-alvarez/null-ls.nvim',
      after = 'nvim-lspconfig',
      config = function() require('user.null-ls') end,
      commit = '08bb00c7c2cd58c72e02cf54e4b9cbfe14b03e09'
    }

    use {
      'folke/trouble.nvim',
      config = function() require('trouble').setup {} end,
      setup = function() require('mappings').trouble() end,
      commit = 'd56bfc0c501ced4002a57cb60433362fb2ce9c4d'
    }

    use {
      'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      config = function()
        require("lsp_lines").setup()
      end,
      commit = '512d8c79637e7aeb889240c2e0ca8ae327940737'
    }

    -- Treesitter --
    use {
      'nvim-treesitter/nvim-treesitter',
      config = function() require 'user.treesitter' end,
      commit = '7e1cb38c382dc1f1feb90a759a26dd600bd39841'
    }

    use {
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = "nvim-treesitter",
      requires = "nvim-treesitter/nvim-treesitter",
      config = function()
        require 'user.treesitter'
        require 'mappings'.treesitter()
      end,
      commit = '35a60f093fa15a303874975f963428a5cd24e4a0'
    }

    use {
      'nvim-treesitter/playground',
      after = 'nvim-treesitter',
      commit = '2b81a018a49f8e476341dfcb228b7b808baba68b'
    }

    -- Autocompletion --
    use {
      'hrsh7th/nvim-cmp',
      config = function() require 'user.nvim-cmp' end,
      commit = 'd153771162bd9795d9f7142df5c674b61066a585',
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
      commit = 'b4bc24c4925aeb05fd47d2ee9b24b7f73f5d7e32'
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
      commit = 'f12408bdb54c39c23e67cab726264c10db33ada8'
    }

    use {
      'rafamadriz/friendly-snippets',
      commit = '1d0dac346de7c6895ac72528df3276386c6b149b'
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
      commit = '6cedcb527e264c8f25e86afa8dae74c6692dee51'
    }

    use {
      'theHamsta/nvim-dap-virtual-text',
      commit = 'ab988dbb7d20cdaebf9b3ef7554a89f6895de042'
    }

    use {
      'rcarriga/nvim-dap-ui',
      commit = '078972d39338a49ec13fc43a44e235cc43189276',
    }

    use {
      'nvim-telescope/telescope-dap.nvim',
      commit = '313d2ea12ae59a1ca51b62bf01fc941a983d9c9c',
    }

    use {
      'mfussenegger/nvim-dap-python',
      commit = '51ecb08dbff57fca8add396b93dc765aba262e0a',
    }

    -- Automation --
    use({
      "jackMort/ChatGPT.nvim",
      commit = 'ef0cf1f28a22bbf2e9be531f4856d2cace57e4b2',
      config = function() require('user.chatgpt').setup() end,
      setup = function() require 'mappings'.chatgpt() end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
    })

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
