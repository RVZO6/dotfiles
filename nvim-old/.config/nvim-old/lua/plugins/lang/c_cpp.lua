return {
	-- Treesitter parsers for C/C++
	{
		"nvim-treesitter/nvim-treesitter",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"c",
				"cpp",
			},
		},
	},

	-- Mason setup for C/C++
	{ "mason-org/mason-lspconfig.nvim",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "clangd",
      }
    }
  },
	-- Formatter setup for C/C++
  {
    "stevearc/conform.nvim",
    opts_extend = { "formatters_by_ft" },
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
    },
  },
}
