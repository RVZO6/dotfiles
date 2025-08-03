-- Add and configure colorscheme with lz.n lazy loading
return {
	{
		"citruszest.nvim",
		lazy = false, -- Load immediately since it's a colorscheme
		priority = 1000,
		before = function()
			vim.pack.add({
				{ src = "https://github.com/zootedb0t/citruszest.nvim" },
			})
		end,
		after = function()
			require("citruszest").setup({
				option = { transparent = true },
			})

			vim.cmd("colorscheme citruszest")

			-- Custom highlight overrides
			vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#00FFFF" })
		end,
	},
}
