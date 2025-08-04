-- Leader key
vim.g.mapleader = " "

-- Global vim options
vim.o.number = false
vim.o.signcolumn = "no"
vim.o.cursorline = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.termguicolors = true
vim.o.expandtab = false
vim.o.wrap = false
vim.o.laststatus = 3
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 0
vim.o.ignorecase = true
vim.o.smartcase = false
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.showmatch = true

-- Diagnostics configuration
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
