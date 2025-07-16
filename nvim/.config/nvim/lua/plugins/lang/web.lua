return {
  -- Treesitter parsers for web languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "jsdoc",
      },
    },
  },

  -- Mason setup for web-related tools
  {
    "williamboman/mason-lspconfig.nvim",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "cssls",
        "html",
        "jsonls",
        "marksman",
        "tailwindcss",
        "emmet_ls",
        "vtsls",
        "yamlls",
      },
    },
  },


  -- Formatter setup for web languages
  {
    "stevearc/conform.nvim",
    opts_extend = { "formatters_by_ft" },
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
      },
    },
  },
}
