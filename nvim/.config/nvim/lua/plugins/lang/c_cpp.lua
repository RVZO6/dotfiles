return {
	-- Treesitter parsers for C/C++
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"c",
				"cpp",
			},
		},
	},

	-- Mason setup for C/C++
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"clangd",
			})
		end,
	},
	-- Formatter setup for C/C++
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.formatters_by_ft = opts.formatters_by_ft or {}
			vim.tbl_deep_extend("force", opts.formatters_by_ft, {
				c = { "clang_format" },
				cpp = { "clang_format" },
			})
		end,
	},
}
