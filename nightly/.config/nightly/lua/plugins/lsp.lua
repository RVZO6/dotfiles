return {
	{
		"lazydev.nvim",
		event = { "BufReadPre *.lua", "BufNewFile *.lua" },
		-- event = { "DeferredUIEnter" },
		before = function()
			vim.pack.add({
				{ src = "https://github.com/folke/lazydev.nvim" },
			})
		end,
		after = function()
			-- LazyDev setup (must be before LSP)
			require("lazydev").setup({
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			})
			-- blink cmp lazydev integration
			-- NOTE: no idea why i need to re pack add. :/
			vim.pack.add({
				{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range('1.0') },
			})
			require("blink.cmp").setup({
				enabled = function()
					return vim.bo.filetype ~= "minifiles"
				end,
				sources = {
					default = { "lazydev", "lsp", "path", "snippets", "buffer" },
					providers = {
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
					},
				},
			})
		end,
	},
	{
		"nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		before = function()
			vim.pack.add({
				{ src = "https://github.com/neovim/nvim-lspconfig" },
			})
		end,
		after = function()
			-- Enable LSP servers
			vim.lsp.enable({ "lua_ls", "biome", "tinymist", "vtsls", "kotlin_lsp", "emmet_ls" })
		end,
	},
}
