return {
  -- Treesitter parsers for Lua
  {
    "nvim-treesitter/nvim-treesitter",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "lua",
        "luadoc",
        "luap",
      },
    },
  },

  -- Mason setup for Lua
  {
    "mason-org/mason-lspconfig.nvim",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "lua_ls",
      }
    }
  },

  -- Formatter setup for Lua
  {
    "stevearc/conform.nvim",
    opts_extend = { "formatters_by_ft" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },
}
