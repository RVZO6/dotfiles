return {
  -- Configure mason-lspconfig to ensure the hyprls is installed
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "hyprls", -- Hyprland language server
      },
    },
  },
  -- Configure nvim-lspconfig to use the hyprls
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        hyprls = {
          filetypes = { "hyprlang" },
        },
      },
    },
  },
  -- Configure nvim-treesitter to install the hyprlang parser
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "hyprlang",
      },
    },
  },
  -- Note: No dedicated formatter exists for hyprlang yet
  -- You can remove this section or add a custom formatter if you create one
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters_by_ft = {
  --       hyprlang = { "custom_formatter" },
  --     },
  --   },
  -- },
}
