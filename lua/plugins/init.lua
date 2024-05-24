return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "vue",
        "javascript",
        "typescript",
        "cpp",
        "go",
        "rust",
        "python"
      }
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "clang-format",
        "codelldb",
        "vue-language-server",
        "pyright",
        "rust-analyzer",
        "stylua",
        "html-lsp",
        "css-lsp" ,
        "prettier"
      }
    }
  },
  {
    "theprimeagen/harpoon",
    lazy = false,
    config = function()
      require("configs.harpoon")
    end
  },
}
