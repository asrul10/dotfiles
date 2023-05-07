local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override core plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require("custom.configs.null-ls")
        end,
      },
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end, -- Override to setup mason-lspconfig
  },

  -- Override core plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  -- Installed a plugins
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },

  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup()
    end,
  },

  {
    "asrul10/readable-number.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    priority = 1000,
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        signs = false,
      })
    end,
  },

  {
    "folke/which-key.nvim",
    enabled = false,
  },
}

return plugins
