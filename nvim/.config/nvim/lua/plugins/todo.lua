return {
  "vimichael/floatingtodo.nvim",
  keys = {
    { "<leader>t", ":Td<CR>", { silent = true } },
  },
  opts = {
    target_file = "~/notes/todo.md",
    border = "rounded", -- single, rounded, etc.
    width = 0.8, -- width of window in % of screen size
    height = 0.8, -- height of window in % of screen size
    position = "center", -- topleft, topright, bottomleft, bottomright
  },
}
