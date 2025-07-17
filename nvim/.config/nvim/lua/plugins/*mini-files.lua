local MiniFiles = require("mini.files")

return {
  "echasnovski/mini.files",
  keys = {
    {
      "<leader>e",
      function()
        MiniFiles.open()
      end,
      desc = "Mini Files: open dir of current file",
    },
    {
      "<leader>o",
      function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        MiniFiles.reveal_cwd()
      end,
      desc = "Mini Files: open cwd",
    },
  },
  opts = {
    options = {
      use_as_default_explorer = true,
    },
    mappings = {
      close = "<Esc>",
      synchronize = "y",
    },
    windows = {
      width_focus = 30,
      width_nofocus = 10,
      width_preview = 15,
      max_number = 3,
    },
  },
}
