local lsps = {
  { "ts_ls" },
  { "html" },
  { "cssls" },
  { "cssmodules_ls" },
  {
    "lua_ls",
    {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    },
  },
  { "tailwindcss" },
  { "gopls", {
    settings = {
      gopls = {
        usePlaceholders = true,
      },
    },
  } },
  { "ruby_lsp" },
}

for _, lsp in pairs(lsps) do
  local name, config = lsp[1], lsp[2]

  vim.lsp.enable(name)

  if config then
    vim.lsp.config(name, config)
  end
end

-- local lspconfig = require("lspconfig")
--
-- -- Enable tsserver
-- lspconfig.ts_ls.setup({})
--
-- -- Enable html
-- -- Enable (broadcasting) snippet capability for completion
-- local html_capabilities = vim.lsp.protocol.make_client_capabilities()
-- html_capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- lspconfig.html.setup({
--   capabilities = html_capabilities,
--   filetypes = { "html", "eruby" },
--   init_options = {
--     provideFormatter = false, -- It adds bad indentation in erb templates
--   },
-- })
--
-- -- Enable cssls
-- -- Enable (broadcasting) snippet capability for completion
-- local css_capabilities = vim.lsp.protocol.make_client_capabilities()
-- css_capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- lspconfig.cssls.setup({ capabilities = css_capabilities })
--
-- -- Enable cssmodules_ls
-- lspconfig.cssmodules_ls.setup({})
--
-- -- Enable lua_ls
-- lspconfig.lua_ls.setup({
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = "LuaJIT",
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { "vim" },
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- })
--
-- -- Enable tailwindcss
-- lspconfig.tailwindcss.setup({})
--
-- -- Enable gopls
-- lspconfig.gopls.setup({
--   settings = {
--     gopls = {
--       usePlaceholders = true,
--     },
--   },
-- })
--
-- -- Enable ruby-lsp
-- lspconfig.ruby_lsp.setup({})

vim.diagnostic.config({
  virtual_text = true,
})

-- Global mappings
--
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "K", function()
    --   vim.lsp.buf.hover({ border = border })
    -- end, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})
