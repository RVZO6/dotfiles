return {
  'wojciech-kulik/xcodebuild.nvim',
  enabled = vim.fn.has 'macunix' == 1,
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'MunifTanjim/nui.nvim',
    'folke/snacks.nvim', -- (optional) to show previews
    'nvim-treesitter/nvim-treesitter', -- (optional) for Quick tests support (required Swift parser)
  },
  config = function()
    require('xcodebuild').setup {
      -- put some options here or leave it empty to use default settings
    }
  end,
}
