local options = {
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

return options
