vim.keymap.del("n", "<leader>|")
vim.keymap.set("n", "<leader>=", "<cmd>vsplit<CR>", { desc = "Split Window Right" })

vim.keymap.set("n", "<Tab>", ">>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true })
vim.keymap.set("i", "<Tab>", "<C-t>", { noremap = true })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true })
