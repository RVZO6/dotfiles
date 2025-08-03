return {
	{
		"smart-splits.nvim",
		event = { "DeferredUIEnter" },
		before = function()
			vim.pack.add({ { src = "https://github.com/mrjones2014/smart-splits.nvim" } })
		end,
		-- Lazy-loads when any of the keymaps below are pressed
		keys = {
			-- Resize splits
			{
				"<A-h>",
				function() require("smart-splits").resize_left() end,
				desc = "Resize split left",
				mode = { "n", "i", "v", "t" },
			},
			{
				"<A-j>",
				function() require("smart-splits").resize_down() end,
				desc = "Resize split down",
				mode = { "n", "i", "v", "t" },
			},
			{
				"<A-k>",
				function() require("smart-splits").resize_up() end,
				desc = "Resize split up",
				mode = { "n", "i", "v", "t" },
			},
			{
				"<A-l>",
				function() require("smart-splits").resize_right() end,
				desc = "Resize split right",
				mode = { "n", "i", "v", "t" },
			},

			-- Move between splits
			{
				"<C-h>",
				function() require("smart-splits").move_cursor_left() end,
				desc = "Move to left split",
			},
			{
				"<C-j>",
				function() require("smart-splits").move_cursor_down() end,
				desc = "Move to below split",
			},
			{
				"<C-k>",
				function() require("smart-splits").move_cursor_up() end,
				desc = "Move to above split",
			},
			{
				"<C-l>",
				function() require("smart-splits").move_cursor_right() end,
				desc = "Move to right split",
			},
			{
				"<C-\\>",
				function() require("smart-splits").move_cursor_previous() end,
				desc = "Move to previous split",
			},

			-- Swap buffers
			{
				"<leader>bh",
				function() require("smart-splits").swap_buf_left() end,
				desc = "Swap buffer left",
			},
			{
				"<leader>bj",
				function() require("smart-splits").swap_buf_down() end,
				desc = "Swap buffer down",
			},
			{
				"<leader>bk",
				function() require("smart-splits").swap_buf_up() end,
				desc = "Swap buffer up",
			},
			{
				"<leader>bl",
				function() require("smart-splits").swap_buf_right() end,
				desc = "Swap buffer right",
			},
		},

		after = function()
			require("smart-splits").setup({})
		end,
	},
}
