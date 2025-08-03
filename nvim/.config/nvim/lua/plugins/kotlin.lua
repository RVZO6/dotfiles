return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = false,
      },
    },
  },
  -- Separate entry for kotlin_lsp
  {
    "kotlin-lsp-enable",
    dir = vim.fn.stdpath("config"),
    config = function()
      vim.lsp.enable("kotlin_lsp")
    end,
    dependencies = { "neovim/nvim-lspconfig" },
    ft = "kotlin", -- Only load for Kotlin files
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "kotlin-lsp",
      },
    },
  },
}
