return {
	-- Treesitter parsers for Python
	{
		"nvim-treesitter/nvim-treesitter",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"python",
			},
		},
	},

	-- Mason setup for Python
	{
		"williamboman/mason-lspconfig.nvim",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"basedpyright",
			},
		},
	},

	-- Formatter setup for Python
	{
		"stevearc/conform.nvim",
		opts_extend = { "formatters_by_ft" },
		opts = {
			formatters_by_ft = {
				python = { "ruff" },
			},
		},
	},
}
