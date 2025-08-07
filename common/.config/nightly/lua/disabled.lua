-- disable some plugins that i dont need
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
