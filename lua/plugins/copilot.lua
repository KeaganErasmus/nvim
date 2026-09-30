vim.pack.add({
	"https://github.com/github/copilot.vim",
	"https://github.com/folke/sidekick.nvim",
})

vim.keymap.set("n", "<leader>aa", function()
	require("sidekick.cli").toggle()
end, { desc = "Toggle Sidekick AI CLI" })

vim.keymap.set({ "n" }, "<leader>ce", "<cmd>Copilot enable<CR>", { desc = "Copilot: enable" })
vim.keymap.set({ "n" }, "<leader>cd", "<cmd>Copilot disable<CR>", { desc = "Copilot: disable" })
