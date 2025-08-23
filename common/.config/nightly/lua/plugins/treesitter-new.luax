return {
	-- First: Core nvim-treesitter on main branch
	{
		"nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		before = function()
			vim.pack.add({
				{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
			})
		end,
		after = function()
			-- Basic setup for main branch (minimal config)
			require("nvim-treesitter").setup({
				-- Directory to install parsers and queries to
				install_dir = vim.fn.stdpath('data') .. '/site'
			})
		end,
	},

	-- Second: treesitter-modules.nvim to restore missing functionality
	{
		"treesitter-modules",
		event = { "BufReadPost", "BufNewFile" },
		before = function()
			vim.pack.add({
				{ src = "https://github.com/MeanderingProgrammer/treesitter-modules.nvim" },
			})
		end,
		after = function()
			require("treesitter-modules").setup({
				-- Equivalent to your old ensure_installed - parsers to always install
				-- ensure_installed = {
				-- 	"c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
				-- 	"python", "javascript", "typescript", "rust", "go", "html", "css"
				-- },

				-- Equivalent to your old ignore_install
				ignore_install = {},

				-- Install parsers synchronously (only applied to ensure_installed)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- This was removed in main branch but restored by treesitter-modules
				auto_install = true,

				-- -- Restore highlighting functionality
				-- highlight = {
				-- 	enable = true,
				-- 	-- List of languages to disable highlighting for
				-- 	disable = {},
				-- 	-- Run both syntax and treesitter highlighting
				-- 	additional_vim_regex_highlighting = false,
				-- },

				-- -- Restore incremental selection (completely missing in main branch)
				-- incremental_selection = {
				-- 	enable = true,
				-- 	keymaps = {
				-- 		init_selection = "gnn",
				-- 		node_incremental = "grn",
				-- 		scope_incremental = "grc",
				-- 		node_decremental = "grm",
				-- 	},
				-- },
				--
				-- -- Restore indent functionality
				-- indent = {
				-- 	enable = true,
				-- 	-- List of languages to disable indent for
				-- 	disable = {},
				-- },
				--
			})
		end,
	},
}
