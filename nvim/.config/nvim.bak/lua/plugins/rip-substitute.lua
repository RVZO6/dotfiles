return {
  'chrisgrieser/nvim-rip-substitute',
  cmd = 'RipSubstitute',
  opts = {
    keymaps = {
      abort = '<Esc>',
    },
  },
  keys = {
    {
      '<leader>fs',
      function()
        require('rip-substitute').sub()
      end,
      mode = { 'n', 'x' },
      desc = ' rip substitute',
    },
  },
}
