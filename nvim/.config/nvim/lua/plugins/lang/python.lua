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
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"basedpyright",
			})
		end,
	},

	-- Formatter setup for Python
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.formatters_by_ft = opts.formatters_by_ft or {}
			vim.tbl_deep_extend("force", opts.formatters_by_ft, {
				python = { "ruff" },
			})
		end,
	},
}
