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
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      -- https://github.com/yetone/avante.nvim?tab=readme-ov-file#default-setup-configuration
      -- Copilot with Claude model https://x.com/yetone/status/1858639471031579093
      provider = "copilot",
      copilot =  {
        model = 'claude-3.5-sonnet'
      },
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        temperature = 0,
        max_tokens = 4096,
      },
      mappings = {
        submit = {
          normal = "<CR>",
          insert = "<CR>",
        },
      },
      windows = {
        sidebar_header = {
          enabled = false,
        },
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
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
}
