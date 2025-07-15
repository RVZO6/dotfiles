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
		"WhoIsSethDaniel/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"clang-format",
			},
		},
	},
	-- Formatter setup for C/C++
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				c = { "clang_format" },
				cpp = { "clang_format" },
			},
		},
	},
}
