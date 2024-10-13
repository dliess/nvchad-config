return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
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
        "rust-analyzer",
        "stylua",
        "html-lsp",
        "css-lsp" ,
        "prettier"
      }
    }
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
  -- {
  --   "epwalsh/obsidian.nvim",
  --   version = "*",  -- recommended, use latest release instead of latest commit
  --   lazy = true,
  --   ft = "markdown",
  --   -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  --   -- event = {
  --   --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   --   "BufReadPre path/to/my-vault/**.md",
  --   --   "BufNewFile path/to/my-vault/**.md",
  --   -- },
  --   dependencies = {
  --     -- Required.
  --     "nvim-lua/plenary.nvim",
  --
  --     -- see below for full list of optional dependencies 👇
  --   },
  --   opts = {
  --     workspaces = {
  --       {
  --         name = "personal",
  --         path = "~/disk@danita-hp/obsidian/obsidian_vaults_on_ipad/Personal",
  --       },
  --       {
  --         name = "work",
  --         path = "~/disk@danita-hp/obsidian/obsidian_vaults_on_ipad/Work",
  --       },
  --     },
  --
  --   -- see below for full list of options 👇
  --   },
  -- },
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
