-- Global keymaps (not plugin-specific)
local keymap = vim.keymap.set

-- File operations
keymap("n", "<leader>o", ":update<CR> :source<CR>")
keymap("n", "<leader>w", ":write<CR>")
keymap("n", "<leader>W", ":wa<CR>")
keymap("n", "<leader>q", ":quit<CR>")
keymap("n", "<leader>Q", ":quitall!<CR>")

-- Clear search highlight
keymap({ "n", "v" }, "<Esc>", "<Cmd>nohlsearch<CR><Esc>", { noremap = true })
keymap("i", "<Esc>", "<Esc><Cmd>nohlsearch<CR>", { noremap = true })

-- LSP
keymap("n", "<leader>cf", vim.lsp.buf.format)

-- Plugin management
keymap("n", "<leader>pu", function()
	vim.pack.update(nil, { force = false })
end, { desc = "Update plugins with confirmation" })

keymap("n", "<leader>pU", function()
	vim.pack.update(nil, { force = true })
	vim.notify("All plugins updated!")
end, { desc = "Update all plugins automatically" })
