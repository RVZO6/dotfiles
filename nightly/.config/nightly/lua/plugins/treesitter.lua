-- Add and configure treesitter with lz.n lazy loading
return {
	{
		"nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		before = function()
			vim.pack.add({
				{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
			})
		end,
		after = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
			})
		end,
	},
}
