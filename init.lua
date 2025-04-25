require("config.lazy")
require("oil").setup()
require("config.keymaps")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})


vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- or "" for a cleaner look
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
