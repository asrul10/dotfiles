---@type ChadrcConfig
local M = {}
local fn = vim.fn
local modes = {
  ["n"] = { "NORMAL", "Normal" },
  ["no"] = { "NORMAL (no)", "Normal" },
  ["nov"] = { "NORMAL (nov)", "Normal" },
  ["noV"] = { "NORMAL (noV)", "Normal" },
  ["noCTRL-V"] = { "NORMAL", "Normal" },
  ["niI"] = { "NORMAL i", "Normal" },
  ["niR"] = { "NORMAL r", "Normal" },
  ["niV"] = { "NORMAL v", "Normal" },
  ["nt"] = { "NTERMINAL", "NTerminal" },
  ["ntT"] = { "NTERMINAL (ntT)", "NTerminal" },

  ["v"] = { "VISUAL", "Visual" },
  ["vs"] = { "V-CHAR (Ctrl O)", "Visual" },
  ["V"] = { "V-LINE", "Visual" },
  ["Vs"] = { "V-LINE", "Visual" },
  [""] = { "V-BLOCK", "Visual" },

  ["i"] = { "INSERT", "Insert" },
  ["ic"] = { "INSERT (completion)", "Insert" },
  ["ix"] = { "INSERT completion", "Insert" },

  ["t"] = { "TERMINAL", "Terminal" },

  ["R"] = { "REPLACE", "Replace" },
  ["Rc"] = { "REPLACE (Rc)", "Replace" },
  ["Rx"] = { "REPLACEa (Rx)", "Replace" },
  ["Rv"] = { "V-REPLACE", "Replace" },
  ["Rvc"] = { "V-REPLACE (Rvc)", "Replace" },
  ["Rvx"] = { "V-REPLACE (Rvx)", "Replace" },

  ["s"] = { "SELECT", "Select" },
  ["S"] = { "S-LINE", "Select" },
  [""] = { "S-BLOCK", "Select" },
  ["c"] = { "COMMAND", "Command" },
  ["cv"] = { "COMMAND", "Command" },
  ["ce"] = { "COMMAND", "Command" },
  ["r"] = { "PROMPT", "Confirm" },
  ["rm"] = { "MORE", "Confirm" },
  ["r?"] = { "CONFIRM", "Confirm" },
  ["x"] = { "CONFIRM", "Confirm" },
  ["!"] = { "SHELL", "Terminal" },
}
local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end
local is_activewin = function()
  return vim.api.nvim_get_current_win() == vim.g.statusline_winid
end

local customStatusline = {
  mode = function()
    if not is_activewin() then
      return ""
    end

    local m = vim.api.nvim_get_mode().mode

    local current_mode = "%#St_" .. modes[m][2] .. "Mode# " .. modes[m][1] .. " "
    return current_mode
  end,
  file = function()
    local path = vim.api.nvim_buf_get_name(stbufnr())
    local name = (path == "" and "Empty ") or path:match "([^/\\]+)[/\\]*$"

    return "%#St_file# " .. name .. " "
  end,
  git = function()
    if not vim.b[stbufnr()].gitsigns_head or vim.b[stbufnr()].gitsigns_git_status then
      return "%#St_gitIcons#"
    end

    local git_status = vim.b[stbufnr()].gitsigns_status_dict

    local added = (git_status.added and git_status.added ~= 0) and (" +" .. git_status.added) or ""
    local changed = (git_status.changed and git_status.changed ~= 0) and (" ~" .. git_status.changed) or ""
    local removed = (git_status.removed and git_status.removed ~= 0) and (" -" .. git_status.removed) or ""
    local branch_name = " " .. git_status.head .. " "

    return "%#St_gitIcons#" .. branch_name .. added .. changed .. removed
  end,
  lsp_msg = function()
    if not rawget(vim, "lsp") or vim.lsp.status or not is_activewin() then
      return ""
    end

    local Lsp = vim.lsp.util.get_progress_messages()[1]

    if vim.o.columns < 120 or not Lsp then
      return ""
    end

    if Lsp.done then
      vim.defer_fn(function()
        vim.cmd.redrawstatus()
      end, 1000)
    end

    local msg = Lsp.message or ""
    local title = Lsp.title or ""
    local content = string.format(" %%<%s %s ", title, msg)

    return "%#St_LspMsg#" .. (content or "")
  end,
  diagnostics = function()
    if not rawget(vim, "lsp") then
      return ""
    end

    local err = #vim.diagnostic.get(stbufnr(), { severity = vim.diagnostic.severity.ERROR })
    local warn = #vim.diagnostic.get(stbufnr(), { severity = vim.diagnostic.severity.WARN })
    local hints = #vim.diagnostic.get(stbufnr(), { severity = vim.diagnostic.severity.HINT })
    local info = #vim.diagnostic.get(stbufnr(), { severity = vim.diagnostic.severity.INFO })

    err = (err and err > 0) and ("%#St_lspError#" .. err .. " ") or ""
    warn = (warn and warn > 0) and ("%#St_lspWarning#" .. warn .. " ") or ""
    hints = (hints and hints > 0) and ("%#St_lspHints#" .. hints .. " ") or ""
    info = (info and info > 0) and ("%#St_lspInfo#" .. info .. " ") or ""

    return " " .. err .. warn .. hints .. info
  end,
  lsp = function()
    if rawget(vim, "lsp") then
      for _, client in ipairs(vim.lsp.get_active_clients()) do
        if client.attached_buffers[stbufnr()] and client.name ~= "null-ls" and client.name ~= "copilot" then
          return (vim.o.columns > 100 and "%#St_Lsp#" .. client.name .. " ") or ""
        end
      end
    end

    return "%#St_Lsp#" .. ""
  end,
  cwd = function()
    local name = vim.loop.cwd()
    name = "%#St_CommandMode#" .. " " .. (name:match "([^/\\]+)[/\\]*$" or name) .. " "
    return (vim.o.columns > 85 and name) or ""
  end,
  cursor = function()
    local current_line = fn.line "."
    local current_column = fn.col "."
    return "%#St_pos_text#" .. " " .. current_line .. ":" .. current_column .. " "
  end,
}

M.ui = {
  theme = "gruvbox",
  transparency = true,
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
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
    modules = customStatusline,
  },
  tabufline = {
    modules = {
      btns = function()
        return ""
      end,
    },
  },
}

return M
