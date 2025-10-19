return {
  {
    "mellow-theme/mellow.nvim",
    config = function()
      vim.g.mellow_transparent = true
      vim.cmd([[colorscheme Mellow]])
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
    end,
  },
  -- NOTE: fuck
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "mellow",
  --   },
  -- },
}
