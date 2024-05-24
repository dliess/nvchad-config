return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
      -- require "plugins.configs.lspconfig"
      -- require "configs.lspconfig"
    end
  },
  {
    "ggandor/leap.nvim",
    event = 'BufEnter',
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
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
        "clangd",
        "clang-format",
        "codelldb",
        "vue-language-server",
        "pyright",
        "rust-analyzer"
      }
    }
  },
  {
    "github/copilot.vim",
    event = 'BufEnter',
    config = function() require("configs.copilot") end
  },
  {
    "mbbill/undotree",
    event = 'BufEnter'
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "theprimeagen/harpoon",
    lazy = false,
    config = function()
      require("configs.harpoon")
    end
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim" ,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
    version = "^1.0.0",
  },
  -- { BROKEN FOR NVCHAD2.5
  --   "nvim-neorg/neorg",
  --   lazy = false,
  --   build = ":Neorg sync-parsers",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("neorg").setup {
  --       load = {
  --         ["core.defaults"] = {}, -- Loads default behaviour
  --         ["core.concealer"] = {}, -- Adds pretty icons to your documents
  --         ["core.dirman"] = { -- Manages Neorg workspaces
  --           config = {
  --             workspaces = {
  --               notes = "~/notes",
  --             },
  --           },
  --         },
  --         ["core.summary"] = {},
  --       },
  --     }
  --   end,
  -- }
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
