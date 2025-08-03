return {
	{
		"render-markdown.nvim",
		ft = "markdown",
		before = function()
			vim.pack.add({ { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
			} })
		end,
		after = function()
			require('render-markdown').setup({
				render_modes = { "n", "c", "t", "i" },
				code = {
					language_border = "",
				},
			})
		end
	}
}
