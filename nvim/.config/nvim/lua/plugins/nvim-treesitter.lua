local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
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
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  embedded_template = { enable = true },
})

-- use this to enable highlighting in eruby.yaml files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "eruby.yaml",
  command = "set filetype=yaml",
})
