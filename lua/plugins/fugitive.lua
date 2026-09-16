vim.pack.add({
	"https://github.com/tpope/vim-fugitive",
})

vim.keymap.set("n", "<leader>gg", "<cmd>Git<CR>", { desc = "Fugitive Status" })

vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Fugitive Blame" })

vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git Commit" })

-- vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git Push" })

vim.keymap.set("n", "<leader>gP", "<cmd>Git pull --rebase<CR>", { desc = "Git Pull (rebase)" })

vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite<CR>", { desc = "Stage Current File" })

vim.keymap.set("n", "<leader>gr", "<cmd>Gread<CR>", { desc = "Checkout Current File" })

vim.keymap.set("n", "<leader>gD", "<cmd>Gvdiffsplit<CR>", { desc = "Diff Against Index" })

vim.keymap.set("n", "<leader>ge", "<cmd>Gedit<CR>", { desc = "Edit Index Version" })

vim.keymap.set("n", "<leader>gl", "<cmd>Git log<CR>", { desc = "Git Log" })

vim.keymap.set("n", "<leader>gL", "<cmd>Git log --oneline<CR>", { desc = "Git Log (oneline)" })
