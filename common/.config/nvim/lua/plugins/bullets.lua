return {
  "bullets-vim/bullets.vim",
  ft = { "markdown", "text", "gitcommit" },
  init = function()
    -- Disable built-in mappings
    -- vim.g.bullets_set_mappings = 0
  end,
  keys = {
    {
      "<leader>cX",
      "<cmd>ToggleCheckbox<CR>",
      desc = "Toggle checkbox (cascade)",
      mode = "n",
      ft = { "markdown", "text", "gitcommit" },
    },
    {
      "<leader>cx",
      function()
        -- Temporarily disable the cascade behavior
        vim.g.bullets_nested_checkboxes = 0
        -- Run the toggle command
        vim.cmd("ToggleCheckbox")
        -- Restore the global setting to its default
        vim.g.bullets_nested_checkboxes = 1
      end,
      desc = "Toggle checkbox",
      mode = "n",
      ft = { "markdown", "text", "gitcommit" },
    },
  },
  config = function()
    vim.g.bullets_delete_last_bullet_if_empty = 2
    vim.g.bullets_nested_checkboxes = true -- preserve default behavior
  end,
}
