return {
  'catgoose/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    user_default_options = {
      -- This is the key setting.
      -- It disables highlighting for plain color names like "black" or "cyan".
      names = true,
      names_opts = {
        lowercase = false,
        uppercase = true,
      },

      -- Ensure that hex codes are still highlighted.
      RRGGBB = true, -- For #RRGGBB format
      RRGGBBAA = true, -- For #RRGGBBAA format

      -- Optional: You can also control CSS functions like rgb() and hsl().
      -- It's good practice to keep these enabled if you edit CSS.
      css = true,
      css_fn = true,
    },
  },
}
