require("lualine").setup({
	sections = {
		lualine_x = { "encoding", { "filetype", icon_only = true } },
	},
	extensions = { "nvim-tree" },
})
