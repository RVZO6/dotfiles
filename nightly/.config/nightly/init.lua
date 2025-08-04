local disabled = {
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tutor",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"matchit",
	"matchparen",
	"logiPat",
	"rrhelper",
	-- "netrw",
	-- "netrwPlugin",
	-- "netrwSettings",
	-- "netrwFileHandlers",
}
for _, p in ipairs(disabled) do
	vim.g["loaded_" .. p] = 1
end

-- Load core configuration
require('options')
require('keymaps')
require('autocmds')

-- Add lz.n for lazy loading
vim.pack.add({
	{ src = "https://github.com/nvim-neorocks/lz.n" }
})

-- Setup lz.n for lazy loading
require("lz.n").load("plugins")
