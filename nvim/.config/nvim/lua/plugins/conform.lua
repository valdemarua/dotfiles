local file_exists = require("utils").file_exists

require("conform").setup({
  formatters = {
    erb_format = {
      args = { "--stdin", "--print-width", "120" },
    },
    biome = {
      require_cwd = true,
    },
    ["biome-check"] = {
      require_cwd = true,
    },
    --   rubocop = {
    --     command = "bundle",
    --     args = {
    --       "exec",
    --       "rubocop",
    --       "--server",
    --       "-a",
    --       "-f",
    --       "quiet",
    --       "--stderr",
    --       "--stdin",
    --       "$FILENAME",
    --     },
    --     exit_codes = { 0, 1 },
    --   },
  },
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    -- python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    -- javascript = { { "prettierd", "prettier" } },
    -- javascript = function(bufnr)
    --   if file_exists(".prettierrc.json", bufnr) then
    --     return { "prettierd", "prettier", stop_after_first = true }
    --   end
    --
    --   return {}
    -- end,
    json = { "prettierd", "prettier", stop_after_first = true },
    jsonc = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    -- javascript = { { "prettier" } },
    javascript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    typescript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
    scss = { "prettierd", "prettier", stop_after_first = true },
    -- ruby = { { "standardrb", "rubocop" } },
    -- ruby = { { "rubocop", "standardrb" } },
    eruby = { "erb_format" },
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
    lsp_fallback = false,
  },
  log_level = vim.log.levels.DEBUG,
  notify_on_error = true,
})

-- format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })
