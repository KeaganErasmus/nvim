--
--
-- ALL KEYMAPS FOR MY CONFIG
--
--
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
-- telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- harpoon keybinds
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "ga", function()
    harpoon:list():add()

    -- Create floating window config
    local buf = vim.api.nvim_create_buf(false, true)
    local width = 30
    local height = 1
    local opts = {
        relative = "editor",
        width = width,
        height = height,
        row = 2,
        col = vim.o.columns - width - 2,
        style = "minimal",
        border = "rounded"
    }

    vim.api.nvim_open_win(buf, false, opts)

    local file = vim.fn.expand("%:t")
    local msg = "📌 Added: " .. file
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { msg })

    -- Automatically close after 1.5 seconds
    vim.defer_fn(function()
        pcall(vim.api.nvim_buf_delete, buf, { force = true })
    end, 1500)
end, { desc = "Add file to harppon" })

vim.keymap.set("n", "ge", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Show harpoon files" })

vim.keymap.set("n", "<C-q>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-w>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-e>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-h>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():next() end)

vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        local win = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    end
})
