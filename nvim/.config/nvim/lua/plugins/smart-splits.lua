return {
  "mrjones2014/smart-splits.nvim",
  -- Add this 'opts' table to configure the plugin
  opts = {},
  keys = function()
    local smart_splits = require("smart-splits")
    return {
      -- resizing splits (NO CHANGES NEEDED HERE)
      { "<A-h>", smart_splits.resize_left, desc = "Resize split left" },
      { "<A-j>", smart_splits.resize_down, desc = "Resize split down" },
      { "<A-k>", smart_splits.resize_up, desc = "Resize split up" },
      { "<A-l>", smart_splits.resize_right, desc = "Resize split right" },

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
