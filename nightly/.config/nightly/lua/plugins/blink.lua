return {
	{
		"blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		before = function()
			vim.pack.add({
				{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range('1.*') },
			})
		end,
		after = function()
			require("blink.cmp").setup({
				cmdline = {
					keymap = {
						['<Tab>'] = { 'show', 'accept' },
					},
					completion = {
						menu = {
							auto_show = function()
								return vim.fn.getcmdtype() == ':'
							end
						}
					}
				}
			})
		end,
	},
}
