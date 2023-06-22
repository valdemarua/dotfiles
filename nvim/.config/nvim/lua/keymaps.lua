local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a space
vim.g.mapleader = " "

-- Clear search highlighting with <leader> and c
map("n", "<leader>c", ":nohl<CR>")

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>")
-- Open nvim config
map("n", "<leader>rc", ":vs ~/.config/nvim/init.lua<CR>")

-- Close buffer with <leader> and q
map("n", "<leader>q", "<c-w>q")
map("n", "<leader>w", ":w<CR>")

-- Save buffer with Ctrl+s
map("n", "<c-s>", ":w<CR>", {})
map("i", "<c-s>", "<Esc>:w<CR>a", {})

-- Add new line by with Enter in normal mode
map("n", "<CR>", "o<Esc>", {})

-- nvim-tree
map("n", "<c-n>", ":NvimTreeToggle<CR>", {})
map("n", "<leader>nf", ":NvimTreeFindFile<CR>", {})

-- Move around splits using Ctrl + {h, j, k, l}
local opts = { noremap = true }
map("n", "<c-h>", "<c-w>h", opts)
map("n", "<c-j>", "<c-w>j", opts)
map("n", "<c-k>", "<c-w>k", opts)
map("n", "<c-l>", "<c-w>l", opts)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>p", builtin.find_files, {})
vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Alternate Toggler
vim.keymap.set("n", "+", "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>")

-- Vim test
vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", {})
vim.keymap.set("n", "<leader>T", ":TestFile<CR>", {})
vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", {})
vim.keymap.set("n", "<leader>l", ":TestLast<CR>", {})
vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", {})

-- Fugitive
map("n", "<Leader>gb", ":Git blame<CR>", opts)
map("n", "<Leader>gs", ":Git status<CR>", opts)

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover)
