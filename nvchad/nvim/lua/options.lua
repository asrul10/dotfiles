require "nvchad.options"

-- add yours here!

local autocmd = vim.api.nvim_create_autocmd
local g = vim.g
local opt = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
g.toggle_theme_icon = ""
opt.number = true
opt.relativenumber = true
-- opt.colorcolumn = "85"
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

-- Set shiftwidth 4 based on PHP file type
vim.cmd [[autocmd FileType php setlocal shiftwidth=4]]

-- Set shiftwidth 4 based on project name
local project_name = "aa"
autocmd("BufEnter", {
  pattern = "*",
  command = "if expand('%:p') =~# '" .. project_name .. "' | setlocal shiftwidth=4 | endif",
})

-- Copilot
g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', {
  silent = true,
  expr = true,
  noremap = true,
})
