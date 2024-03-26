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
  "folke/which-key.nvim",
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
  },
  { "folke/tokyonight.nvim", lazy = false },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.6",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
    event = "VeryLazy",
  },
  {
    "benfowler/telescope-luasnip.nvim",
    module = "telescope._extensions.luasnip", -- if you wish to lazy-load
  },
  {
    "rmagatti/alternate-toggler",
    event = "VeryLazy",
  },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "terrortylor/nvim-comment" },
  {
    "cappyzawa/trim.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    -- for better support of eruby.yaml
    "cuducos/yaml.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
  },
  -- LSP
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  {
    "stevearc/conform.nvim",
    opts = {},
    event = "VeryLazy",
  },
  -- Refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  -- CMP
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    -- follow latest release.
    version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  -- ruby, rails, rspec
  {
    "tpope/vim-rails",
    event = "VeryLazy",
  },
  {
    "vim-ruby/vim-ruby",
    event = "VeryLazy",
  },
  {
    "keith/rspec.vim",
    event = "VeryLazy",
  },
  -- to run rspec, jest and other tests
  {
    "vim-test/vim-test",
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  -- git
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
    event = "VeryLazy",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  -- Want to turn fooBar into foo_bar? Press crs (coerce to snake_case).
  -- MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru),
  -- dash-case (cr-), dot.case (cr.), space case (cr<space>),
  -- and Title Case (crt) are all just 3 keystrokes away.
  {
    "tpope/vim-abolish",
    event = { "BufReadPre", "BufNewFile" },
  },
  "dstein64/vim-startuptime",
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      -- alternative characters: ¦, ┆, │, ⎸, ▏
      require("ibl").setup({ indent = { char = "┆" } })
    end,
    event = "VeryLazy",
  },
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup()
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
    {
      "NvChad/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({})
      end,
      event = "VeryLazy",
    },
  },
})
