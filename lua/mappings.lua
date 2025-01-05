require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)

-- Harpoon keybindings
map('n', 'ga', ":lua require('harpoon.mark').add_file()<CR>", { desc = "Harpoon add"})
map('n', 'gm', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Harpoon list"})

-- LSP lines 
map('n', '<leader>tl', ':lua require("lsp_lines").toggle()<CR>', opts)

-- more git binds
map("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame", silent = true })
map("n", "<leader>gd", ":Git diff<CR>", { desc = "Git diff", silent = true })
map("n", "<leader>gl", ":Git log<CR>", { desc = "Git log", silent = true })
