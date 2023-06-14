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
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "folke/tokyonight.nvim", lazy = false },
	{ "nvim-telescope/telescope.nvim", version = "0.1.0", dependencies = { { "nvim-lua/plenary.nvim" } } },
	{ "rmagatti/alternate-toggler" },
	{ "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "terrortylor/nvim-comment" },
	{ "cappyzawa/trim.nvim" },
	{ "nvim-treesitter/nvim-treesitter" },
	-- LSP
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	-- null-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		-- config = function()
		--   require("null-ls").setup()
		-- end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- CMP
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{ "cappyzawa/trim.nvim" },
	-- ruby, rails, rspec
	"tpope/vim-rails",
	"vim-ruby/vim-ruby",
	"keith/rspec.vim",
	-- to run rspec, jest and other tests
	"vim-test/vim-test",
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	-- git
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
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
})
