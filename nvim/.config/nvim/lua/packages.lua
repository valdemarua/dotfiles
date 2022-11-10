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

  -- ruby, rails, rspec
  use 'tpope/vim-rails'
  use 'vim-ruby/vim-ruby'
  use 'keith/rspec.vim'

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
end)
