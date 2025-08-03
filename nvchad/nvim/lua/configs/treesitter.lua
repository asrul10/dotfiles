local options = {
  ensure_installed = {
    -- Git
    "diff",

    -- HTML CSS
    "html",
    "css",
    "scss",

    -- TypeScript, JavaScript
    "javascript",
    "typescript",
    "tsx",

    -- Rust
    "rust",

    -- Go
    "go",
    "gomod",

    -- Vim
    "vim",
    "lua",

    -- PHP
    "php",

    -- Json
    "json",

    -- Markdown
    "markdown",
    "markdown_inline",

    -- Yaml
    "yaml",

    -- Docker
    "dockerfile",

    -- SQL
    "sql",

    -- Bash
    "bash",

    -- Graphql
    "graphql",

    -- Python
    "python",
  },
  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
}

return options
