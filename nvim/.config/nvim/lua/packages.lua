local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  }

  -- ruby, rails, rspec
  use 'tpope/vim-rails'
  use 'vim-ruby/vim-ruby'
  use 'keith/rspec.vim'

  -- to run rspec, jest and other tests
  use 'vim-test/vim-test'

  -- color schemes
  use 'folke/tokyonight.nvim'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  use "terrortylor/nvim-comment"
  use "folke/which-key.nvim"

  use {
    'rmagatti/alternate-toggler',
    config = function()
      vim.keymap.set(
      "n",
      "<leader>ta", -- <space><space>
      "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>"
      )
    end,
    -- event = { "BufReadPost" }, -- lazy load after reading a buffer
  }

  use 'cappyzawa/trim.nvim'

  -- git, github
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- nvim-surround
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
