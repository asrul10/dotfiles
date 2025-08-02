local servers = {
  html = {},
  cssls = {},
  rust_analyzer = {},
  gopls = {},
  intelephense = {},
  jsonls = {},
  dockerls = {},
  bashls = {},
  marksman = {},
  yamlls = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
        },
      },
    },
  },
  tailwindcss = {
    filetypes = { "typescriptreact" },
    root_dir = function(bufnr, on_dir)
      local fname = vim.api.nvim_buf_get_name(bufnr)
      local root_marker = vim.fs.find(".tailwindcss", { path = fname, upward = true })[1]

      if root_marker then
        on_dir(vim.fs.dirname(root_marker))
      end
    end,
  },
  ts_ls = {
    single_file_support = false,
    root_markers = { ".tsserver" },
    workspace_required = true,
  },
  denols = {
    root_markers = { ".denols" },
    workspace_required = true,
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

local x = vim.diagnostic.severity
vim.diagnostic.config {
  virtual_text = { prefix = "" },
  signs = { text = { [x.ERROR] = "E", [x.WARN] = "W", [x.INFO] = "I", [x.HINT] = "H" } },
  underline = true,
  float = { border = "single" },
}
