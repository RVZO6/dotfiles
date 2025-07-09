return {
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VeryLazy", -- Sets the loading event to 'VimEnter'
		opts = {
			-- delay between pressing a key and opening which-key (milliseconds)
			-- this setting is independent of vim.o.timeoutlen
			preset = "modern",
			show_help = false,
			delay = 0,
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = true,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
			},
			-- Document existing key chains
			spec = {
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>f", group = "[F]ind" },
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
