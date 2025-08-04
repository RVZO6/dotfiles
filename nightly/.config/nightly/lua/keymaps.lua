-- Global keymaps (not plugin-specific)
local map = vim.keymap.set

-- File operations
map("n", "<leader>o", ":update<CR> :source<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>W", ":wa<CR>")
map("n", "<leader>q", ":quit<CR>")
map("n", "<leader>Q", ":quitall!<CR>")

-- Clear search highlight
map({ "n", "v" }, "<Esc>", "<Cmd>nohlsearch<CR><Esc>", { noremap = true })
map("i", "<Esc>", "<Esc><Cmd>nohlsearch<CR>", { noremap = true })

-- LSP
map("n", "<leader>cf", vim.lsp.buf.format)

-- Plugin management
map("n", "<leader>pu", function()
	vim.pack.update()
end, { desc = "Update plugins with confirmation" })

map("n", "<leader>pU", function()
	vim.pack.update(nil, { force = true })
	vim.notify("All plugins updated!")
end, { desc = "Update all plugins automatically" })
