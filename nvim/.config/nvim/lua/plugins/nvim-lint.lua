local file_exists = require("utils").file_exists
local lint = require("lint")

lint.linters_by_ft = {
  -- markdown = { "vale" },
  -- ruby = { "rubocop" },
  javascript = { "biomejs" },
  typescript = { "biomejs" },
  javasriptreact = { "biomejs" },
  typescriptreact = { "biomejs" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    lint.try_lint() -- run all default linters by filetype

    -- run  linters conditionally
    if vim.bo.filetype == "ruby" then
      if file_exists(".rubocop.yml", 0) then -- 0 - current buffer
        lint.try_lint("rubocop")
      end

      if file_exists(".standard.yml", 0) then -- 0 - current buffer
        lint.try_lint("standardrb")
      end
    end

    -- You can call `try_lint` with a linter name or a list of names to always
    -- run specific linters, independent of the `linters_by_ft` configuration
    -- lint.try_lint("cspell")
  end,
})
