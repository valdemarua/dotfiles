local file_exists = require("utils").file_exists

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    -- python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    jsonc = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    -- javascript = { { "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    scss = { { "prettierd", "prettier" } },
    -- ruby = { { "standardrb", "rubocop" } },
    -- ruby = { { "rubocop", "standardrb" } },
    ruby = function(bufnr)
      if file_exists(".rubocop.yml", bufnr) then
        return { "rubocop" }
      end

      if file_exists(".standard.yml", bufnr) then
        return { "standardrb" }
      end

      return {}
    end,
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 800,
    lsp_fallback = true,
  },
  log_level = vim.log.levels.ERROR,
  notify_on_error = true,
})

-- format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })
