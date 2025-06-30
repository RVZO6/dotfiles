return {
  'echasnovski/mini.files',
  opts = {
    mappings = {
      close = '<Esc>',
      synchronize = 'y',
    },
    windows = {
      width_focus = 30,
      width_nofocus = 10,
      width_preview = 15,
      max_number = 3,
    },
  },
  keys = {
    {
      '<leader>e',
      function()
        require('mini.files').open()
      end,
      mode = { 'n', 'x' },
      desc = 'Open mini.files',
      silent = true,
    },
    {
      '<leader>o',
      function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        MiniFiles.reveal_cwd()
      end,
      mode = { 'n', 'x' },
      desc = 'Open mini.files in current file dir',
      silent = true,
    },
  },
}
