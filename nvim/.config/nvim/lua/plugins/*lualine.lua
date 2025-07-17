return {
  "nvim-lualine/lualine.nvim",
  enabled = false,
  --   opts = function(_, opts)
  --     -- 1. Get the theme. It might be a string (e.g., "auto") or a table.
  --     local theme = opts.options.theme
  --
  --     -- 2. If it's a string, require the theme table from lualine
  --     if type(theme) == "string" then
  --       theme = require("lualine.themes." .. theme)
  --     end
  --
  --     -- 3. Now that 'theme' is guaranteed to be a table,
  --     --    iterate over its modes and sections to make them transparent.
  --     for _, mode in pairs(theme) do
  --       for _, section in pairs(mode) do
  --         section.bg = "none"
  --       end
  --     end
  --
  --     opts.options.theme = theme
  --
  --     return opts
  --   end,
}

-- return {
--   {
--     "nvim-lualine/lualine.nvim",
--     enabled = false,
--     init = function()
--       vim.opt.laststatus = 3
--       vim.g.lualine_laststatus = 3
--
--       vim.api.nvim_set_hl(0, "StatusLine", { fg = "#00FFFF", bg = "NONE" })
--       vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#00FFFF", bg = "NONE" })
--       vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#00FFFF", bg = "NONE" })
--     end,
--   },
-- }
