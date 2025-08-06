return {
	{
		"render-markdown.nvim",
		-- for lsp buf highlight
		event = { "LspAttach" },
		ft = { "markdown", },
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
	},
	{
		"bullets.vim",
		ft = { "markdown", "text", "gitcommit", },
		before = function()
			vim.pack.add({ { src = "https://github.com/bullets-vim/bullets.vim" } })
		end,
		init = function()
			-- Disable built-in mappings
			-- vim.g.bullets_set_mappings = 0
		end,
		keys = {
			{
				"<leader>cX",
				"<cmd>ToggleCheckbox<CR>",
				desc = "Toggle checkbox (cascade)",
				mode = "n",
				ft = { "markdown", "text", "gitcommit", },
			},
			{
				"<leader>cx",
				function()
					-- Temporarily disable the cascade behavior
					vim.g.bullets_nested_checkboxes = 0
					-- Run the toggle command
					vim.cmd("ToggleCheckbox")
					-- Restore the global setting to its default
					vim.g.bullets_nested_checkboxes = 1
				end,
				desc = "Toggle checkbox",
				mode = "n",
				ft = { "markdown", "text", "gitcommit", },
			},
		},
		after = function()
			vim.g.bullets_delete_last_bullet_if_empty = 2
			vim.g.bullets_nested_checkboxes = true -- preserve default behavior
			vim.g.markdown_recommended_style = 0
			vim.g.bullets_outline_levels = { 'std-' }
		end,
	},
	{
		"markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		before = function()
			vim.pack.add({ { src = "https://github.com/iamcco/markdown-preview.nvim" } })
			vim.fn["mkdp#util#install"]()
		end,
		keys = {
			{
				"<leader>cp",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown Preview",
				ft = { "markdown", },
			},
		},
		after = function()
			vim.cmd([[do FileType]])
		end,
	}
}
----BROKEN
