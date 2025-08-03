return {
	{
		"mini.ai",
		event = { "BufReadPost", "BufNewFile" },
		before = function()
			vim.pack.add({ { src = 'https://github.com/echasnovski/mini.ai' } })
		end,
		after = function()
			local ai = require('mini.ai')

			local function ai_buffer(ai_type)
				local s_line, e_line = 1, vim.fn.line("$")
				if ai_type == "i" then
					local first = vim.fn.nextnonblank(s_line)
					local last  = vim.fn.prevnonblank(e_line)
					if first == 0 or last == 0 then
						return { from = { line = s_line, col = 1 } }
					end
					s_line, e_line = first, last
				end

				-- column at the end: max length or 1
				local last_col = math.max(#vim.fn.getline(e_line), 1)
				return {
					from = { line = s_line, col = 1 },
					to   = { line = e_line, col = last_col },
				}
			end

			require('mini.ai').setup({
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" },                       -- digits
					e = {                                      -- Word with case
						{ "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
						"^().*()$",
					},
					g = ai_buffer,
					u = ai.gen_spec.function_call(), -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
				},
			})
		end,
	},
}
