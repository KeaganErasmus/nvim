--
--
-- ALL KEYMAPS FOR MY CONFIG
--
--
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("n", "<leader>\\", ":vsplit<CR>", { noremap = false, silent = true})

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })

function toggle_quickfix()
  if not vim.tbl_isempty(vim.fn.getwininfo()) and vim.bo.buftype == "quickfix" then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end
vim.api.nvim_set_keymap("n", "<leader>qf", ":lua toggle_quickfix()<CR>", { silent = true })

-- some keybinds to make deving easier
--
-- Run build.bat with F5
vim.keymap.set("n", "<F5>", function()
  vim.cmd("!cmd /c build.bat")
end, { desc = "Run build.bat" })

-- Run run.bat with F6
vim.keymap.set("n", "<F6>", function()
  vim.cmd("!cmd /c run.bat")
end, { desc = "Run run.bat" })

-- telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>cd", "<CMD>Copilot disable<CR>", { desc = "Disable copilot" })
vim.keymap.set("n", "<leader>ce", "<CMD>Copilot enable<CR>", { desc = "Enable copilot" })

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

vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<A-h>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-l>", function() harpoon:list():next() end)

vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        local win = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    end
})
-- Tab keymaps
-- Move to previous/next
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
map('n', '<A-w>', '<Cmd>BufferClose<CR>', opts)
-- Re-order to previous/next
-- map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
-- map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
