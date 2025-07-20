-- lua/plugins/lsp/harper-ls.lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["harper-ls"] = {
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
