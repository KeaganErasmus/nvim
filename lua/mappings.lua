require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)

-- Harpoon keybindings
map('n', 'ga', ":lua require('harpoon.mark').add_file()<CR>")
map('n', 'gm', ":lua require('harpoon.ui').toggle_quick_menu()<CR>")

map('n', '<leader>tl', ':lua require("lsp_lines").toggle()<CR>', opts)
