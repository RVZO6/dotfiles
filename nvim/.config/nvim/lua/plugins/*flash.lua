return {
  {
    "folke/flash.nvim",
    opts = {
      prompt = {
        enabled = false,
      },
      config = function(_, opts)
        require("flash").setup(opts)
        vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = "#696969" })
      end,
    },
  },
}
