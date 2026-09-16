vim.g.mapleader = " "

-- OPTIONS
vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.list = true
vim.o.confirm = true
vim.o.tabstop = 4

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldcolumn = "0"
vim.o.foldtext = ""
vim.o.foldlevel = 99
-- vim.o.foldlevelstart = 1
-- vim.o.foldnestmax = 4

-- Sync clipboard between OS and Neovim.
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		vim.o.clipboard = "unnamedplus"
	end,
})

-- KEYMAPS
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`
--
-- Use <Esc> to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Terminal: exit to normal mode" })
vim.keymap.set({ "t", "i" }, "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
vim.keymap.set({ "t", "i" }, "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
vim.keymap.set({ "t", "i" }, "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
vim.keymap.set({ "t", "i" }, "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })
vim.keymap.set({ "n" }, "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set({ "n" }, "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set({ "n" }, "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set({ "n" }, "<C-l>", "<C-w>l", { desc = "Go to right window" })

vim.api.nvim_set_keymap(
	"n",
	"<space>k",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	{ desc = "Show line diagnostics in a float" }
)

-- moving around buffers
vim.keymap.set({ "n" }, "<A-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set({ "n" }, "<A-h>", "<cmd>bprev<CR>", { desc = "Previous buffer" })

vim.keymap.set({ "n" }, "<C-RIGHT>", "<cmd>vertical res +5<CR>", { desc = "Widen window" })
vim.keymap.set({ "n" }, "<C-LEFT>", "<cmd>vertical res -5<CR>", { desc = "Narrow window" })
vim.keymap.set({ "n" }, "<C-UP>", "<cmd>horizontal res -5<CR>", { desc = "Shrink window height" })
vim.keymap.set({ "n" }, "<C-DOWN>", "<cmd>horizontal res +5<CR>", { desc = "Grow window height" })

-- vim.keymap.set("n", "<leader>e", vim.cmd.Lexplore)

-- AUTOCOMMANDS (EVENT HANDLERS)
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.hl_op()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "snacks_picker_input" },
	callback = function(args)
		vim.b[args.buf].minicompletion_disable = true
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- See `:h nvim_create_user_command()` and `:h user-commands`
-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command("GitBlameLine", function()
	local line_number = vim.fn.line(".") -- Get the current line number. See `:h line()`
	local filename = vim.api.nvim_buf_get_name(0)
	print(vim.system({ "git", "blame", "-L", line_number .. ",+1", filename }):wait().stdout)
end, { desc = "Print the git blame for the current line" })
-- vim.keymap.set({ "n" }, "<leader>gbl", "<cmd>GitBlameLine<CR>")

-- PLUGINS
-- See `:h :packadd`, `:h vim.pack`
vim.cmd("packadd! nohlsearch")
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	-- Fuzzy picker
	"https://github.com/ibhagwan/fzf-lua",
	-- Autocompletion
	"https://github.com/nvim-mini/mini.completion",
	-- Enhanced quickfix/loclist
	"https://github.com/stevearc/quicker.nvim",
	-- Git integration
	"https://github.com/lewis6991/gitsigns.nvim",

	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",

	"https://github.com/windwp/nvim-autopairs",
})
require("fzf-lua").setup({ fzf_colors = true })
require("mini.completion").setup({})
require("quicker").setup({})
require("gitsigns").setup({})
require("nvim-autopairs").setup()

require("plugins")
