-- markdown disable diagnostics by default
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   group = vim.api.nvim_create_augroup("disable_markdown_diagnostics_on_enter", { clear = true }),
--   callback = function(args)
--     local bufnr = args.buf
--     -- Check if diagnostics are already disabled before attempting to disable again
--     if vim.diagnostic.is_enabled({ bufnr = bufnr }) then
--       -- vim.diagnostic.enable(false, { bufnr = bufnr })
--       -- HACK: snacks toggle workaround. deprecated but will change when snacks updates
--       vim.diagnostic.disable(bufnr)
--     end
--   end,
-- })

--cmdwin buffer quit keybind
vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = vim.api.nvim_create_augroup("CmdwinQuit", { clear = true }),
  callback = function()
    -- Map 'q' in normal mode (buffer-local) to close the window with :quit
    vim.api.nvim_buf_set_keymap(
      0, -- current buffer
      "n", -- normal mode
      "q", -- key to map
      ":quit<CR>", -- command to run
      { noremap = true, silent = true }
    )
  end,
})
