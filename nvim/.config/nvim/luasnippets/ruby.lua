local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

return {
  s("hco", { t("have_content("), i(1, ""), t(")") }),
  s("hat", { t("have_attributes("), i(1, ""), t(")") }),
  s("hst", {
    t("expect(response).to have_http_status("),
    c(1, {
      i(1, ":ok"),
      i(1, ":created"),
      i(1, ":bad_request"),
      i(1, ":unauthorized"),
      i(1, ":forbidden"),
      i(1, ":not_found"),
      i(1, ":unprocessable_entity"),
    }),
    t(")"),
  }),
  s("itis", fmt("it {{ is_expected.to {}({}) }}", { i(1, "belong_to"), i(2, "") })),
}
