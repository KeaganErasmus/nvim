vim.pack.add({
'https://github.com/folke/snacks.nvim'
})

require('snacks').setup(
{
    bigfile = { enabled = true },
    dashboard = { enabled = false},
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true},
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
})

vim.keymap.set("n", "<leader>tt", function()
  Snacks.terminal()
end)

vim.keymap.set('n', '<leader>e', function()Snacks.explorer() end)
vim.keymap.set('n', '<leader>ff', function()Snacks.picker.files() end)
vim.keymap.set('n', '<leader>fg', function()Snacks.picker.grep() end)

-- Git stuff
vim.keymap.set("n", "<leader>gb", function()
  Snacks.picker.git_branches()
end, { desc = "Git Branches" })

vim.keymap.set("n", "<leader>gl", function()
  Snacks.picker.git_log()
end, { desc = "Git Log" })

vim.keymap.set("n", "<leader>gL", function()
  Snacks.picker.git_log_line()
end, { desc = "Git Log Line" })

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
