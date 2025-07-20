return {
  "folke/noice.nvim",
  enabled = false,
  -- currently broken with win.o.winborder and i dont need it sooooooooo
  opts = {
    views = {
      cmdline_popup = {
        position = {
          row = "35%", -- around eye-line level
          col = "50%", -- centered horizontally
        },
      },
      presets = {
        lsp_doc_border = true,
      },
    },
  },
}
