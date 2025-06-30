return {
  'zootedb0t/citruszest.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    option = {
      transparent = true,
    },
  },
  config = function(_, opts)
    require('citruszest').setup(opts)
    vim.cmd 'colorscheme citruszest'

    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#61AFEF' })
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#00FFFF', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = '#1AFFA3', bg = 'NONE', bold = true })
    vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = '#1AFFA3', bg = 'NONE', bold = true })
    vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = '#1AFFA3', bg = 'NONE', bold = true })
  end,
}
