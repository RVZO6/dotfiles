return {
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_winwidth = 20
			vim.g.db_ui_show_database_icon = 1
			vim.g.db_ui_win_position = "left"
			vim.g.db_ui_auto_execute_table_helpers = 1
			vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_ui"
			vim.api.nvim_set_hl(0, "NotificationInfo", { fg = "white", bg = "NONE" })
			vim.api.nvim_set_hl(0, "NotificationWarning", { fg = "yellow", bg = "NONE" })
			vim.api.nvim_set_hl(0, "NotificationError", { fg = "red", bg = "NONE" })
		end,
	},
	{ -- optional saghen/blink.cmp completion source
		"saghen/blink.cmp",
		opts = {
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					sql = { "snippets", "dadbod", "buffer" },
				},
				-- add vim-dadbod-completion to your completion providers
				providers = {
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				},
			},
		},
	},
	-- Mason setup for SQL tools
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"sqlls",
				"sleek",
			})
		end,
	},

	-- SQL formatting
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				sql = { "sleek" },
				mysql = { "sleek" },
				plsql = { "sleek" },
			},
			formatters = {
				sleek = {
					command = "sleek",
					args = "--indent-spaces=2 --lines-between-queries=3",
				},
			},
		},
	},

	-- Treesitter for SQL syntax
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "sql" },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "sql" },
			},
			indent = { enable = true },
		},
	},
}
