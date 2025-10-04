return {
  -- from lua/plugins/*bufferline.lua
  { "akinsho/bufferline.nvim", enabled = false },

  -- from lua/plugins/*lualine.lua
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },

  -- from lua/plugins/*snacks.lua
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
    },
    opts = {
      explorer = { enabled = false },
      indent = { enabled = false },
      statuscolumn = { enabled = false },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    enabled = false,
  },
}
