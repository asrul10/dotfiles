local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local util = require("lspconfig/util")

local lspconfig = require("lspconfig")

local function lspSymbol(name, icon)
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol("Error", "E")
lspSymbol("Info", "I")
lspSymbol("Hint", "H")
lspSymbol("Warn", "W")

-- if you just want default config for the servers then put them in a table
local servers = {
	-- HTML
	"html",

	-- CSS
	"cssls",

	-- Rust
	"rust_analyzer",

	-- Go
	"gopls",

	-- PHP
	"intelephense",

	-- JSON
	"jsonls",

	-- Docker
	"dockerls",

	-- Bash
	"bashls",

  -- Markdown
  "marksman",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- Tailwind
lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "typescriptreact" },
	root_dir = util.root_pattern(".tailwindcss"),
})

-- TypeScript, JavaScript
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = util.root_pattern(".tsserver"),
	single_file_support = false,
})

-- Deno
lspconfig.denols.setup({
	on_attach = on_attach,
	root_dir = util.root_pattern(".denols"),
})
