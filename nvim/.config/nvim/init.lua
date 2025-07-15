--------------------------------------------
--------------------Lazy--------------------
--------------------------------------------

-- Set leader keys BEFORE loading plugins
vim.g.mapleader = " " -- Leader = space
vim.g.maplocalleader = "\\" -- Local leader = backslash
-- Bootstrap lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.loop.fs_stat or vim.uv.fs_stat)(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath) -- Add lazy.nvim to runtime path
require("lazy").setup({
	spec = { { import = "plugins" } },
	checker = { enabled = true }, -- Auto-check for updates
	install = { missing = true },
})

--------------------------------------------
-------------------Options------------------
--------------------------------------------

vim.o.number = false
vim.o.cmdheight = 0
vim.o.laststatus = 3
vim.opt.swapfile = false
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.cmdheight = 0
vim.schedule(function()
	if
		vim.fn.has("macunix") == 1
		or (vim.fn.has("unix") == 1 and (vim.fn.executable("xclip") == 1 or vim.fn.executable("xsel") == 1))
	then
		vim.o.clipboard = "unnamedplus"
	end
end)
vim.o.breakindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.o.undofile = true
-- case sensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
-- vim.o.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.winborder = "rounded"
vim.diagnostic.config({ virtual_text = true })

--------------------------------------------
-------------------Keymaps------------------
--------------------------------------------

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- vim: ts=2 sts=2 sw=2 et
