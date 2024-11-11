require "nvchad.options"

-- add yours here!
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set ts=2")
vim.cmd("set cmdheight=0")
vim.cmd("set termguicolors")

vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.ts,*.js,*.html,*.css,*.scss,*.json PrettierAsync
  augroup END
]])

local o = vim.o
-- o.cursorlineopt = 'both' -- to enable cursorline!
o.autoindent = true
o.smartindent = true
o.expandtab = true
