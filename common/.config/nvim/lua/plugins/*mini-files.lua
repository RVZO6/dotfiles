return {
  "nvim-mini/mini.files",
  lazy = true,
  keys = {
    { "<leader>fm", false },
    { "<leader>fM", false },
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (Directory of Current File)",
    },
    {
      "<leader>o",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
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
