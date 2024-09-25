local utils = require("utils")

utils.fix_telescope_parens_win()

-- make help and man open up on the side instead above
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "man" },
	command = "wincmd L",
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- vim opts
require("vimopts")

-- language specific mappings go here
require("mappings")

-- lazy.nvim setup
require("lazy").setup("plugins", {
	default = {
		lazy = true,
	},
})

-- theme -- Default options:
require("gruvbox").setup({
	terminal_colors = true,     -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true,        -- invert background for search, diffs, statuslines and errors
	contrast = "hard",     -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
-- treesitter config
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {
		-- "go",
		"rust",
		"c",
		-- "lua",
		-- "python",
		"html",
		"css",
		"javascript",
		"typescript",
		-- "zig",
		-- "sql",
	},
	highlight = { enable = true },
	indent = { enable = true },
})
