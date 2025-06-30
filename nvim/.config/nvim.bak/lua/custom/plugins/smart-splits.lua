return {
  'mrjones2014/smart-splits.nvim',
  -- Add this 'opts' table to configure the plugin
  opts = {
    -- This is the key setting.
    -- The default is 2, so we set it to 1 for smaller resize steps.
    default_amount = 2,
  },
  keys = function()
    local smart_splits = require 'smart-splits'
    return {
      -- resizing splits (NO CHANGES NEEDED HERE)
      { '<A-h>', smart_splits.resize_left, desc = 'Resize split left' },
      { '<A-j>', smart_splits.resize_down, desc = 'Resize split down' },
      { '<A-k>', smart_splits.resize_up, desc = 'Resize split up' },
      { '<A-l>', smart_splits.resize_right, desc = 'Resize split right' },

      -- moving between splits
      { '<C-h>', smart_splits.move_cursor_left, desc = 'Move to left split' },
      { '<C-j>', smart_splits.move_cursor_down, desc = 'Move to below split' },
      { '<C-k>', smart_splits.move_cursor_up, desc = 'Move to above split' },
      { '<C-l>', smart_splits.move_cursor_right, desc = 'Move to right split' },
      { '<C-\\>', smart_splits.move_cursor_previous, desc = 'Move to previous split' },

      -- swapping buffers
      { '<leader><leader>h', smart_splits.swap_buf_left, desc = 'Swap buffer left' },
      { '<leader><leader>j', smart_splits.swap_buf_down, desc = 'Swap buffer down' },
      { '<leader><leader>k', smart_splits.swap_buf_up, desc = 'Swap buffer up' },
      { '<leader><leader>l', smart_splits.swap_buf_right, desc = 'Swap buffer right' },
    }
  end,
}
