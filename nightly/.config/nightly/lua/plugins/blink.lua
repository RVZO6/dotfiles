return {
	{
		"blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		before = function()
			vim.pack.add({
				{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range('1.0') },
			})
		end,
		after = function()
			require("blink.cmp").setup()
		end,
	},
}
