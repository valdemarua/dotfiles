local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter")

if not status_ok then
  return
end

-- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
nvim_treesitter.setup({
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "regex",
    "typescript",
    "tsx",
    "vim",
    "yaml",
    "ruby",
    "embedded_template",
    "markdown",
    "markdown_inline",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "rust",
    "vimdoc",
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  embedded_template = { enable = true },
})

-- use this to enable highlighting in eruby.yaml files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "eruby.yaml",
  command = "set filetype=yaml",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    -- Enable treesitter highlighting and disable regex syntax
    pcall(vim.treesitter.start)
    -- Enable treesitter-based indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
