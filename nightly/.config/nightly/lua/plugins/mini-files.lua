-- Add and configure mini.files with lz.n lazy loading
return {
	{
		"mini.files",
		keys = {
			{ "<leader>e", function() MiniFiles.open() end, desc = "Open mini files" },
		},
		before = function()
			vim.pack.add({
				{ src = "https://github.com/echasnovski/mini.files" },
				{ src = "https://github.com/echasnovski/mini.icons" },
			})
		end,
		after = function()
			require("mini.icons").setup()
			require("mini.files").setup({
				options = {
					use_as_default_explorer = true,
				},
				mappings = {
					close = "<Esc>",
					synchronize = "y",
				},
				windows = {
					width_focus = 30,
					width_nofocus = 10,
					width_preview = 15,
					max_number = 3,
				},
			})
		end,
	},
}
