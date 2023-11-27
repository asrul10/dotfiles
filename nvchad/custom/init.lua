local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
local g = vim.g

g.toggle_theme_icon = ""
opt.number = false
opt.relativenumber = true
opt.colorcolumn = "85"
opt.scrolloff = 8

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Set up diagnostics
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	float = { border = "single" },
})

-- Copilot config
vim.cmd([[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]])
vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = { markdown = true }

-- Set shiftwidth 4 based on PHP file type
vim.cmd([[autocmd FileType php setlocal shiftwidth=4]])

-- Set shiftwidth 4 based on project name
local project_name = "aa"
autocmd("BufEnter", {
	pattern = "*",
	command = "if expand('%:p') =~# '" .. project_name .. "' | setlocal shiftwidth=4 | endif",
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})
autocmd("FileType", {
	pattern = "ejs",
	command = "setlocal filetype=html",
})
