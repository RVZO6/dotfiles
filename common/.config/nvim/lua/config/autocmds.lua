-- Shortcut to quit the Cmdwin buffer
vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = vim.api.nvim_create_augroup("CmdwinQuit", { clear = true }),
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0, -- current buffer
      "n", -- normal mode
      "q", -- key to map
      ":quit<CR>", -- command to run
      { noremap = true, silent = true }
    )
  end,
})
