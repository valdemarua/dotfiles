require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
      },
    },
    layout_config = {
      vertical = { width = 0.5 },
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    },
  },
  -- other configuration values here
})

-- Load telescope-luasnip extension
require("telescope").load_extension("luasnip")
