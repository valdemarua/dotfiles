local set = vim.keymap.set

-- Change leader to a space
vim.g.mapleader = " "

-- Clear search highlighting with <leader> and c
set("n", "<leader>c", ":nohl<CR>")

-- Reload configuration without restart nvim
set("n", "<leader>r", ":so %<CR>")
-- Open nvim config
set("n", "<leader>rc", ":vs ~/.config/nvim/init.lua<CR>")

-- Close buffer with <leader> and q
set("n", "<leader>q", "<c-w>q")
set("n", "<leader>w", ":w<CR>")

-- Save buffer with Ctrl+s
set("n", "<c-s>", ":w<CR>", {})
set("i", "<c-s>", "<Esc>:w<CR>a", {})

-- Add new line below and above current line with Enter in normal mode
set("n", "<CR>", "o<Esc>", {})
set("n", "<S-CR>", "O<Esc>", {})

-- nvim-tree
set("n", "<c-n>", ":NvimTreeToggle<CR>", {})
set("n", "<leader>nf", ":NvimTreeFindFile<CR>", {})

-- Move around splits using Ctrl + {h, j, k, l}
set("n", "<c-h>", "<c-w>h")
set("n", "<c-j>", "<c-w>j")
set("n", "<c-k>", "<c-w>k")
set("n", "<c-l>", "<c-w>l")

-- Telescope
local builtin = require("telescope.builtin")
set("n", "<leader>p", builtin.find_files)
set("n", "<leader>fs", builtin.grep_string)
set("n", "<leader>fg", builtin.live_grep)
set("n", "<leader>fb", builtin.buffers)
set("n", "<leader>fh", builtin.oldfiles)

-- Alternate Toggler
set("n", "+", "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>")

-- Vim test
set("n", "<leader>t", ":TestNearest<CR>")
set("n", "<leader>T", ":TestFile<CR>")
set("n", "<leader>a", ":TestSuite<CR>")
set("n", "<leader>l", ":TestLast<CR>")
set("n", "<leader>g", ":TestVisit<CR>")

-- Fugitive
set("n", "<Leader>gb", ":Git blame<CR>")
set("n", "<Leader>gs", ":Git status<CR>")

-- For use default preset and it work with dot
set("n", "<leader>m", require("treesj").toggle)

set("n", "<leader>sr", ":%s/")
