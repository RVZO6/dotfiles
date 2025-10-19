return {
  -- {
  --   "zootedb0t/citruszest.nvim",
  --   opts = {
  --     option = {
  --       transparent = true,
  --     },
  --     style = {
  --       WinSeparator = { fg = "#00FFFF" },
  --       RenderMarkdownH1BG = { bg = "#552020" },
  --       RenderMarkdownH2BG = { bg = "#103545" },
  --       RenderMarkdownH3BG = { bg = "#404030" },
  --       RenderMarkdownH4BG = { bg = "#2a4f29" },
  --       RenderMarkdownH5BG = { bg = "#503015" },
  --       RenderMarkdownH6BG = { bg = "#0A4040" },
  --     },
  --   },
  -- },
  {
    "mellow-theme/mellow.nvim",
    config = function()
      vim.g.mellow_transparent = true
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "mellow",
    },
  },
}
