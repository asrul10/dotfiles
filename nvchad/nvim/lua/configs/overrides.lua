local M = {}

local function border(hl_name)
	return {
		{ "┌", hl_name },
		{ "─", hl_name },
		{ "┐", hl_name },
		{ "│", hl_name },
		{ "┘", hl_name },
		{ "─", hl_name },
		{ "└", hl_name },
		{ "│", hl_name },
	}
end

M.treesitter = {
	ensure_installed = {
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
	},
	indent = {
		enable = true,
		disable = {
			"python",
		},
	},
}

M.mason = {
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
	},
	ui = {
		icons = {
			package_pending = " ",
			package_installed = " ",
			package_uninstalled = " ",
		},
	},
}

M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.telescope = {
	defaults = {
		prompt_prefix = "  ",
		selection_caret = "  ",
		entry_prefix = "  ",
		layout_config = {
			width = 0.50,
			height = 0.80,
		},
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	},
	pickers = {
		find_files = {
			previewer = false,
		},
		buffers = {
			previewer = false,
		},
	},
}

M.gitsigns = {
	signs = {
		add = { hl = "DiffAdd", text = "+", numhl = "GitSignsAddNr" },
		change = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
		delete = { hl = "DiffDelete", text = "-", numhl = "GitSignsDeleteNr" },
		topdelete = { hl = "DiffDelete", text = "-", numhl = "GitSignsDeleteNr" },
	},
}

M.cmp = {
	window = {
		completion = {
			border = border("CmpBorder"),
			winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
		},
		documentation = {
			border = border("CmpDocBorder"),
		},
	},
}

return M
