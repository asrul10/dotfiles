local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "deno_fmt" },
    javascriptreact = { "deno_fmt" },
    typescript = { "deno_fmt" },
    typescriptreact = { "deno_fmt" },
    rust = { "rustfmt" },
    go = { "goimports", "gofmt" },
    sh = { "shfmt" },
    php = { "php_cs_fixer" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
  },
}

return options
