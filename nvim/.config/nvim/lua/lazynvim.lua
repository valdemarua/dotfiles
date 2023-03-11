local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {"folke/which-key.nvim", lazy = true},
  {"folke/tokyonight.nvim", lazy = false },
  {
    "nvim-telescope/telescope.nvim", version = '0.1.0',
    dependencies ={{'nvim-lua/plenary.nvim'}}
  },
  {'rmagatti/alternate-toggler'},
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  },
  {"terrortylor/nvim-comment"},
  {'cappyzawa/trim.nvim'},
})
