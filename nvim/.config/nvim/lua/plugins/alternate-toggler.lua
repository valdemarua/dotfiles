require("alternate-toggler").setup {
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
    ["to"] = "not_to",
    ["if"] = "unless",
    ["let"] = "const"
  }
}
