-- Load core configuration
require('disabled')
require('options')
require('keymaps')
require('autocmds')

-- Add lz.n for lazy loading
vim.pack.add({
	{ src = "https://github.com/nvim-neorocks/lz.n" }
})

-- Setup lz.n for lazy loading
require("lz.n").load("plugins")
