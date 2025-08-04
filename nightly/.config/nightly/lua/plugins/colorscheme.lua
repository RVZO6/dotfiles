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
				style = {
					WinSeparator = { fg = "#00FFFF" },
					RenderMarkdownH1BG = { bg = "#552020" },
					RenderMarkdownH2BG = { bg = "#103545" },
					RenderMarkdownH3BG = { bg = "#404030" },
					RenderMarkdownH4BG = { bg = "#2a4f29" },
					RenderMarkdownH5BG = { bg = "#503015" },
					RenderMarkdownH6BG = { bg = "#0A4040" },
				},
			})

			vim.cmd("colorscheme citruszest")
		end,
	},
}
