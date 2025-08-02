local options = {
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    highlight = { "Function", "Label" },
    include = {
      node_type = {
        ["python"] = {
          "function_definition",
          "class_definition",
          "if_statement",
          "for_statement",
          "while_statement",
          "with_statement",
          "try_statement",
          "except_clause",
          "finally_clause",
          "list",
          "dictionary",
          "tuple",
          "set",
        },
      },
    },
  },
}

return options
