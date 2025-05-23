local overrides = require "configs.overrides"

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
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
    ft = { "markdown" },
    event = "InsertEnter",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', {
        silent = true,
        expr = true,
        noremap = true,
      })
    end,
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
    config = function()
      require("todo-comments").setup {
        signs = false,
      }
    end,
  },

  {
    "folke/which-key.nvim",
    enabled = false,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "InsertEnter",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "claude-3.7-sonnet",
      context = "buffer",
      prompts = {
        Commit = {
          prompt =
          "$gpt-4o-mini Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block. Only reply commit message",
          context = 'git:staged',
        },
      },
    },
  },

  { import = "nvchad.blink.lazyspec" },
  {
    "Saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = { enabled = false },
      }
    }
  }
}
