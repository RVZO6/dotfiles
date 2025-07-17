return {
  "nvim-lualine/lualine.nvim",
  enabled = false,
  -- this stuff removes the background but i dont even like it anyway
  opts = function(_, opts)
    -- 1. Get the theme. It might be a string (e.g., "auto") or a table.
    local theme = opts.options.theme

    -- 2. If it's a string, require the theme table from lualine
    if type(theme) == "string" then
      theme = require("lualine.themes." .. theme)
    end

    -- 3. Now that 'theme' is guaranteed to be a table,
    --    iterate over its modes and sections to make them transparent.
    for _, mode in pairs(theme) do
      for _, section in pairs(mode) do
        section.bg = "none"
      end
    end

    opts.options.theme = theme

    return opts
  end,
}
