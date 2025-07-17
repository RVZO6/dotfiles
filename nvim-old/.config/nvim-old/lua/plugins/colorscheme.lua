return {
	{
		"zootedb0t/citruszest.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			option = {
				transparent = true,
			},
		},
		config = function(_, opts)
			require("citruszest").setup(opts)
			vim.cmd("colorscheme citruszest")
			vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#00FFFF", bg = "NONE" })
		end,
	},
}
