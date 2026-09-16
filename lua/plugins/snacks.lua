vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
	bigfile = { enabled = true },
	dashboard = { enabled = false },
	-- explorer = { enabled = true },
	-- indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = { ignored = true, hidden = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	lazygit = { enabled = true },
})

vim.keymap.set("n", "<leader>tt", function()
	Snacks.terminal()
end, { desc = "Toggle terminal" })

vim.keymap.set("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "Toggle file explorer" })
-- vim.keymap.set("n", "<leader>ff", function()
-- 	Snacks.picker.files()
-- end)
-- vim.keymap.set("n", "<leader>fg", function()
-- 	Snacks.picker.grep()
-- end)
--

-- Buffer keybinds
-- vim.keymap.set("n", "<leader>fb", function()
-- 	Snacks.picker.buffers()
-- end, { desc = "Find buffers" })
--
-- Git stuff
-- vim.keymap.set("n", "<leader>gl", function()
-- 	-- Snacks.lazygit.log({})
-- 	Snacks.picker.git_log()
-- end, { desc = "Git Log" })

-- vim.keymap.set("n", "<leader>gL", function()
-- 	Snacks.picker.git_log_line()
-- end, { desc = "Git Log Line" })

vim.keymap.set("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, { desc = "Git Status" })

vim.keymap.set("n", "<leader>gS", function()
	Snacks.picker.git_stash()
end, { desc = "Git Stash" })

vim.keymap.set("n", "<leader>gd", function()
	Snacks.picker.git_diff()
end, { desc = "Git Diff (Hunks)" })

vim.keymap.set("n", "<leader>gf", function()
	Snacks.picker.git_log_file()
end, { desc = "Git Log File" })

-- Lazygit (replaced by fugitive, see plugins/fugitive.lua)
-- vim.keymap.set("n", "<leader>gg", function()
-- 	Snacks.lazygit()
-- end, { desc = "Lazygit" })
--
-- vim.keymap.set("n", "<leader>gb", function()
-- 	Snacks.lazygit.log_file()
-- end, { desc = "Lazygit Current File History" })
