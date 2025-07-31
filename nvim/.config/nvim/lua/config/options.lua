vim.opt.number = false -- Disable absolute line numbers
vim.opt.relativenumber = false -- Disable relative line numbers
vim.opt.spell = false
vim.opt.signcolumn = "no" -- no side column
vim.o.winborder = "rounded" -- rounded borders on windows
vim.o.cmdheight = 0
vim.o.laststatus = 3
vim.o.statusline = table.concat({
  "%f", -- Relative path to the file
  " ", -- A space
  "%m", -- Modified flag (shows '[+]' if modified)
  "%r", -- Read-only flag
  "%= ", -- Separator: pushes remaining items to the right
  "%l", -- The line number
  ",",
  "%c", -- The column number
  "         ",
  "%P", -- Percentage through the file
})
vim.g.lazyvim_python_lsp = "basedpyright"
vim.o.termguicolors = true

