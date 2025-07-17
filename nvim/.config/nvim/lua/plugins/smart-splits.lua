return {
  "mrjones2014/smart-splits.nvim",
  -- event = "VeryLazy",
  lazy = true,
  opts = {},
  keys = function()
    local smart_splits = require("smart-splits")
    local modes = { "n", "i", "v", "t" } -- apply in normal, insert, visual, terminal modes
    return {
      -- resizing splits
      { "<A-j>", false },
      { "<A-k>", false },
      { "<A-h>", smart_splits.resize_left, desc = "Resize split left", mode = modes },
      { "<A-j>", smart_splits.resize_down, desc = "Resize split down", mode = modes },
      { "<A-k>", smart_splits.resize_up, desc = "Resize split up", mode = modes },
      { "<A-l>", smart_splits.resize_right, desc = "Resize split right", mode = modes },

      -- moving between splits
      { "<C-h>", smart_splits.move_cursor_left, desc = "Move to left split" },
      { "<C-j>", smart_splits.move_cursor_down, desc = "Move to below split" },
      { "<C-k>", smart_splits.move_cursor_up, desc = "Move to above split" },
      { "<C-l>", smart_splits.move_cursor_right, desc = "Move to right split" },
      { "<C-\\>", smart_splits.move_cursor_previous, desc = "Move to previous split" },

      -- swapping buffers
      { "<leader>bh", smart_splits.swap_buf_left, desc = "Swap buffer left" },
      { "<leader>bj", smart_splits.swap_buf_down, desc = "Swap buffer down" },
      { "<leader>bk", smart_splits.swap_buf_up, desc = "Swap buffer up" },
      { "<leader>bl", smart_splits.swap_buf_right, desc = "Swap buffer right" },
    }
  end,
}
