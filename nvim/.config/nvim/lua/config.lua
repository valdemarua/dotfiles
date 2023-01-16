local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.termguicolors = true                       -- Set termguicolors to enable highlight groups
opt.mouse = 'a'                                -- Enable mouse support
opt.swapfile = false                           -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------

opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Shift 2 spaces when tab
opt.tabstop = 2             -- 1 tab == 2 spaces
opt.smartindent = true      -- Autoindent new lines

opt.cursorline = true -- Highlight the text line of the cursor

opt.number = true
opt.relativenumber = true

opt.scrolloff = 6 -- Number of lines to keep above and below the cursor

-- for nvim-cmp
opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Search
opt.ignorecase = true  -- Ignore case
opt.smartcase = true   -- Use case-sensitive search if one or more character is uppercase
