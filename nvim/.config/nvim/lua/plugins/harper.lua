return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["harper_ls"] = {
        filetypes = {
          "markdown",
          "text",
          "rst",
          "latex",
          "org",
          "asciidoc",
        },
      },
    },
  },
}
