return {
  -- Configure mason-lspconfig to ensure the fish-lsp is installed
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- "fish_lsp", -- this doesnt work for some reason. idk why
      },
    },
  },

  -- Configure nvim-lspconfig to use the fish-lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        fish_lsp = {},
      },
    },
  },

  -- Configure nvim-treesitter to install the fish parser
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "fish",
      },
    },
  },

  -- Configure conform.nvim to use fish_indent for formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        fish = { "fish_indent" },
      },
    },
  },
}
