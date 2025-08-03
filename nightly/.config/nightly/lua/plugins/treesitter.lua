-- Add and configure treesitter with lz.n lazy loading
return {
	{
		"nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		before = function()
			vim.pack.add({
				{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
			})
		end,
		after = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
			})
		end,
	},
}
