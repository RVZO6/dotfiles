return {
  -- Disable kotlin_language_server and enable kotlin_lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = false,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("kotlin_lsp")
    end,
  },

  -- Mason: only ensure kotlin-lsp is installed
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "kotlin-lsp",
      },
    },
  },
}
