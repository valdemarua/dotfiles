require("refactoring").setup()

-- prompt for a refactor to apply when the remap is triggered
vim.keymap.set({ "n", "x" }, "<leader>rr", function()
  require("refactoring").select_refactor()
end)
-- Note that not all refactor support both normal and visual mode
