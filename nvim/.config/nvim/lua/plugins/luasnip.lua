local ls = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/luasnippets" })

ls.filetype_extend("typescriptreact", { "javascript" })

vim.keymap.set({ "i" }, "<C-K>", function()
  ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
  ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
  ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

vim.keymap.set("n", "<Leader>es", function()
  require("luasnip.loaders").edit_snippet_files({
    extend = function(ft, paths)
      if #paths == 0 then
        return {
          {
            "$CONFIG/" .. ft .. ".snippets",
            string.format("%s/%s.snippets", "~/.config/nvim/snippets", ft),
          },
        }
      end

      return {}
    end,
  })
end, { desc = "Edit snippet" })
