vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.wo.relativenumber = true

-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugin configuration
local plugins = {
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd", -- C language server
				-- "gopls",            -- Go language server
				"rust-analyzer", -- Rust language server
				-- "odin-language-server", -- Odin language server
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig", -- LSP configuration
		},
	},
	{
		"ThePrimeagen/harpoon",
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}
local opts = {}
require("lazy").setup(plugins, opts)

require("harpoon").setup()

require("mason").setup()
-- Mason LSPConfig setup
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "rust_analyzer" },
})

-- LSP setup for C, Go, Rust, and Odin
local lspconfig = require("lspconfig")

-- C (Clangd)
lspconfig.clangd.setup({})

-- Go (Gopls)
-- lspconfig.gopls.setup{}

-- Rust (rust-analyzer)
lspconfig.rust_analyzer.setup({})

-- Odin (odin-language-server) - You'll need to have the Odin language server installed
-- lspconfig.odin_language_server.setup{}

-- Telescope keybindings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Gruvbox color scheme setup
require("gruvbox").setup({
	terminal_colors = true,
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
	inverse = true,
	contrast = "soft", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {
		-- "go",
		"rust",
		"c",
		"python",
		"html",
		"css",
		"javascript",
		"typescript",
		"templ",
		"zig",
		"sql",
		"wgsl",
		"asm",
	},
	highlight = { enable = true },
	indent = { enable = true },
})
