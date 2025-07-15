return {
	-- Treesitter parsers for Python
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"python",
			},
		},
	},

	-- Mason setup for Python
	{
		"WhoIsSethDaniel/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"basedpyright",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"ruff",
			},
		},
	},

	-- Formatter setup for Python
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { "ruff" },
			},
		},
	},
}
