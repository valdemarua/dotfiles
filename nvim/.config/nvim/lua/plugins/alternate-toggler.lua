require("alternate-toggler").setup({
  alternates = {
    ["true"] = "false",
    ["True"] = "False",
    ["TRUE"] = "FALSE",
    ["Yes"] = "No",
    ["YES"] = "NO",
    ["1"] = "0",
    ["<"] = ">",
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
    ['"'] = "'",
    ['""'] = "''",
    ["+"] = "-",
    ["==="] = "!==",
    ["let"] = "const",
    ["if"] = "unless",
    --	["unless"] = "if",
    ["to"] = "not_to",
    ["build"] = "create",
    --["create"] = "build_stubbed",
    --		["build_stubbed"] = "build",
  },
})
