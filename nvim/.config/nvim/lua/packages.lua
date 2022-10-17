return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- ruby, rails, rspec
  use 'tpope/vim-rails'
  use 'vim-ruby/vim-ruby'
  use 'keith/rspec.vim'

  -- color schemes
  use 'folke/tokyonight.nvim'
end)
