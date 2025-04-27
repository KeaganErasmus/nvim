require("config.lazy")
require("oil").setup()
require("config.keymaps")
require("config.autocmds")
require("config.opts")

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

-- vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
