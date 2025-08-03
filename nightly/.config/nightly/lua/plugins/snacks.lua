-- Add and configure snacks with lz.n lazy loading
return {
	{
		"snacks.nvim",
		-- lazy = false,
		keys = {
			{ "<leader>ff",    function() Snacks.picker.files() end, desc = "Find files" },
			{ "<leader>sh",    function() Snacks.picker.help() end,  desc = "Find help" },
			{ "<leader>space", function() Snacks.picker.smart() end, desc = "Smart picker" },
			{
				"<C-_>",
				function()
					-- Snacks.terminal(nil, { cwd = vim.fn.getcwd() })
					Snacks.terminal()
				end,
				desc = "Toggle Terminal",
				mode = "n",
			},
			{
				"<C-_>",
				"<C-\\><C-n><Cmd>close<CR>",
				desc = "Close Terminal",
				mode = "t", -- means this runs only in terminal mode
			},

			{
				"<leader>fc",
				function()
					Snacks.picker.files({
						cwd = vim.fn.stdpath("config"),
						title = "Config",
					})
				end,
				desc = "Find config"
			},
			{
				"<leader>sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Search keymaps"
			}
		},
		before = function()
			vim.pack.add({
				{ src = "https://github.com/folke/snacks.nvim" },
				{ src = "https://github.com/echasnovski/mini.icons" },
			})
		end,
		after = function()
			require("mini.icons").setup()
			require("snacks").setup({
				picker = { enabled = true },
				terminal = { enabled = true },
			})
		end,
	},
}
