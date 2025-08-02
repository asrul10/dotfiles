local options = {
  ensure_installed = {
    -- Lua
    "lua-language-server",
    "stylua",

    -- HTML CSS
    "css-lsp",
    "html-lsp",
    "tailwindcss-language-server",
    "prettier",

    -- TypeScript, JavaScript
    "deno",
    "typescript-language-server",
    "eslint_d",

    -- Rust
    "rust-analyzer",

    -- Go
    "gopls",
    "goimports",

    -- Shell
    "shfmt",
    "shellcheck",

    -- PHP
    "intelephense",
    "php-cs-fixer",
    "phpcs",

    -- Json
    "json-lsp",

    -- Docker
    "dockerfile-language-server",

    -- Bash
    "bash-language-server",

    -- Markdown
    "marksman",

    -- Yaml
    "yaml-language-server",

    -- Python
    "pyright",
    "ruff",
  },
  ui = {
    border = "single",
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },
}

return options
