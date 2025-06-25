return {
  'zootedb0t/citruszest.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    style = {
      TelescopePromptTitle = {
        fg = '#1AFFA3', -- The hex code for 'C.bright_green'
        bg = '',
        bold = true,
      },
      TelescopeResultsTitle = {
        fg = '#1AFFA3',
        bg = '',
        bold = true,
      },
      TelescopePreviewTitle = {
        fg = '#1AFFA3',
        bg = '',
        bold = true,
      },
    },
    option = {
      transparent = true,
    },
  },
  config = function(_, opts)
    require('citruszest').setup(opts)
    vim.cmd 'colorscheme citruszest'
    -- Define a border style
    local border = 'rounded' -- alternatives: "single", "double", "solid", "shadow"

    -- Diagnostic float window border
    vim.diagnostic.config {
      float = { border = border },
    }

    -- Ensure general floating windows (via nvim-lspconfig) also use the border
    require('lspconfig.ui.windows').default_options.border = border
  end,
}
