return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "css-lsp",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {},
      },
    },
  },
}
