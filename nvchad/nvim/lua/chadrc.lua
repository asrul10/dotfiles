---@type ChadrcConfig
local M = {}

M.ui = {
  telescope = { style = "bordered" },
  statusline = { enabled = false },
  tabufline = {
    modules = {
      btns = function()
        return ""
      end,
    },
  },
}

M.base46 = {
  theme = "gruvbox",
  ---@diagnostic disable
  changed_themes = {
    gruvbox = {
      -- https://github.com/NvChad/base46/blob/v3.0/lua/base46/themes/gruvbox.lua
      base_30 = {
        grey = "#7c6f64",
        grey_fg = "#7c6f64",
        grey_fg2 = "#7c6f64",
        statusline_bg = "#2e2e2e",
      },
      -- styling https://github.com/chriskempson/base16/blob/main/styling.md
      base_16 = {
        base08 = "#fe8019",
      },
    },
  },
  ---@diagnostic enable
}

return M
