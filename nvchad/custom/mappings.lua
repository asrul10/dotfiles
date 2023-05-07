---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>sa"] = { ":%s/", "Find and replace all" },
    ["<leader>ft"] = { "<cmd>TodoTelescope previewer=false<CR>", "Find TODO" },
    ["<leader>fs"] = { "<cmd>Telescope lsp_document_symbols<CR>", "Find symbols" },
    ["<leader>ww"] = { "<cmd>lua require('readable-number').readable_number()<CR>", "Convert number to readable" },
    ["gcc"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "toggle comment" },
    ["<leader>kk"] = { "<cmd>Telescope keymaps<CR>", "Find keymaps" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move line up" },
    ["<leader>ss"] = { ":s/", "Find and replace selected lines" },
    ["gcc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

return M
