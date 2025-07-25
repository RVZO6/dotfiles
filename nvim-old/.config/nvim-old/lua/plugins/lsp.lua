return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    dependencies = { "saghen/blink.cmp", },
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim",        words = { "Snacks" } },
      },
    },
  },
  { -- optional blink completion source for require statements and module annotations
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    event = "VeryLazy",
    opts_extend = { "ensure_installed" },
    opts = { ensure_installed = {}
    }
  },

  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    dependencies = { "neovim/nvim-lspconfig" },
    opts_extend = { "ensure_installed" },
    opts = {
      automatic_enable = true,
      ensure_installed = {}
    },
  },
}
