---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "gruvbox",
	theme_toggle = { "gruvbox", "one_light" },
	transparency = true,
	changed_themes = {
		gruvbox = {
			-- https://github.com/NvChad/base46/blob/master/lua/base46/themes/monekai.lua
			base_30 = {
				grey = "#7c6f64",
				grey_fg = "#7c6f64",
				grey_fg2 = "#7c6f64",
			},
			-- styling https://github.com/chriskempson/base16/blob/main/styling.md
			base_16 = {
				base08 = "#fe8019",
			},
		},
	},
	statusline = {
		separator_style = "block",
		overriden_modules = function()
			return require("custom.configs.statusline")
		end,
	},
	tabufline = {
		overriden_modules = function()
			return {
				buttons = function()
					return ""
				end,
			}
		end,
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
