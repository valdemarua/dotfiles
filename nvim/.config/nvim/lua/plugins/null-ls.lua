local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Lua
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.luacheck,
    -- JS, TS
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin"
    })
  }
})
