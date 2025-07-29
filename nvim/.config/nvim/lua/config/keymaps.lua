vim.keymap.del("n", "<leader>|")
vim.keymap.set("n", "<leader>=", "<cmd>vsplit<CR>", { desc = "Split Window Right" })

-- HACK: i need this for some reason for the tab rebinds
-- vim.keymap.set("n", "<C-i>", "<C-i>", { noremap = true })

-- vim.keymap.set("n", "<Tab>", ">>", { noremap = true })
-- vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true })
vim.keymap.set("i", "<Tab>", "<C-t>", { noremap = true })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true })
-- Blink completion toggle
Snacks.toggle({
  name = "Completion",
  get = function()
    return vim.b.completion ~= false -- Default to true (ON) if not set
  end,
  set = function(state)
    vim.b.completion = state
    if not state then
      require("blink.cmp").hide()
    end
  end,
}):map("<leader>u/")
