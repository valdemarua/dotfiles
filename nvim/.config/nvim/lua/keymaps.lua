local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ' '

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')
-- Open nvim config
map('n', '<Leader>rc', ':vs ~/.config/nvim/init.lua<CR>')

-- Close buffer with <leader> and q
map('n', '<leader>q', '<c-w>q')

-- Save buffer with Ctrl+s
map('n', '<c-s>', ':w<CR>', {})
map('i', '<c-s>', '<Esc>:w<CR>a', {})

-- nvim-tree
map('n', '<c-n>', ':NvimTreeToggle<CR>', {})
map('n', '<c-f>', ':NvimTreeFindFile<CR>', {})

-- Move around splits using Ctrl + {h, j, k, l}
local opts = { noremap = true }
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-k>', '<c-w>k', opts)
map('n', '<c-l>', '<c-w>l', opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
