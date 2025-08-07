-- Global autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Format on save
autocmd("BufWritePre", {
	group = augroup("FormatOnSave", { clear = true }),
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

-- Command window quit mapping
autocmd("CmdwinEnter", {
	group = augroup("CmdwinQuit", { clear = true }),
	callback = function(args)
		vim.api.nvim_buf_set_keymap(args.buf, "n", "q", ":quit<CR>", { noremap = true, silent = true })
	end,
})
