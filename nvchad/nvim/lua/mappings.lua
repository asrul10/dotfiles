require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>sa", ":%s/", { desc = "Find and replace all" })
map("n", "<leader>ft", "<cmd>TodoTelescope previewer=false<CR>", { desc = "Find TODO" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Find symbols" })
map(
  "n",
  "<leader>ww",
  "<cmd>lua require('readable-number').readable_number()<CR>",
  { desc = "Convert number to readable" }
)
map("n", "gcc", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "toggle comment" })
map("n", "<leader>kk", "<cmd>Telescope keymaps<CR>", { desc = "Find keymaps" })
map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open line diagnostics" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("v", "<leader>ss", ":s/", { desc = "Find and replace selected lines" })
map(
  "v",
  "gcc",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Toggle comment" }
)

map("n", "]c", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
map("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })
