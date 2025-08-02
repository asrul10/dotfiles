return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    opts = require "configs.lspconfig",
  },

  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = require "configs.telescope",
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = require "configs.gitsigns",
  },

  {
    "github/copilot.vim",
    lazy = false,
    ft = { "markdown" },
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
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require "configs.todo-comments",
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = require "configs.copilotchat",
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "Saghen/blink.cmp",
    opts = require "configs.blink",
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = require "configs.blankline",
  },

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = require "configs.lualine",
  },

  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },

  {
    "folke/which-key.nvim",
    enabled = false,
  },
}
