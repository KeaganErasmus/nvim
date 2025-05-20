--Vim opts
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.confirm = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.inccommand = "nosplit"
vim.opt.ignorecase = true
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.updatetime = 500
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.laststatus = 3
vim.opt.background = "dark"
vim.opt.selection = "exclusive"
vim.opt.virtualedit = "onemore"
vim.opt.showcmd = false
vim.opt.title = true
vim.opt.titlestring = "%<%F%=%l/%L - nvim"
vim.opt.linespace = 8
vim.opt.mousemoveevent = true
vim.opt.syntax = "off"
vim.opt.spelllang = { "en" }
-- vim.opt.colorcolumn = "120"

vim.opt.foldlevelstart = 99
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

