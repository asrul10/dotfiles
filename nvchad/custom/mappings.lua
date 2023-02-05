local M = {}

M.general = {
	n = {
		["<leader>sa"] = { ":%s/", "Find and replace all" },
		["<leader>ft"] = { ":TodoTelescope previewer=false<CR>", "Find TODO" },
		["<leader>ww"] = { ":lua require('readable-number').readable_number()<CR>", "Convert number to readable" },
	},
	v = {
		["J"] = { ":m '>+1<CR>gv=gv", "move line down" },
		["K"] = { ":m '<-2<CR>gv=gv", "move line up" },
		["<leader>ss"] = { ":s/", "Find and replace selected lines" },
	},
}

return M
