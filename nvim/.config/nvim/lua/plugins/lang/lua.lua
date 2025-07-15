return {
	-- Treesitter parsers for Lua
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"lua",
				"luadoc",
				"luap",
			},
		},
	},

	-- Mason setup for Lua
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"lua_ls",
			})
		end,
	},

	-- Formatter setup for Lua
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.formatters_by_ft = opts.formatters_by_ft or {}
			vim.tbl_deep_extend("force", opts.formatters_by_ft, {
				lua = { "stylua" },
			})
		end,
	},
}
