vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})

vim.lsp.enable("vtsls")
vim.lsp.enable("clangd")
vim.lsp.enable("stylua")
vim.lsp.enable("ols")
vim.lsp.enable("angularls")
vim.lsp.enable("gopls")
vim.lsp.enable("rust_analyzer")

-- Copy the shared buffer-local opts and attach a which-key description.
local function desc(opts, text)
	return vim.tbl_extend("force", opts, { desc = text })
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, desc(opts, "LSP: go to definition"))
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, desc(opts, "LSP: go to declaration"))
		vim.keymap.set("n", "gr", vim.lsp.buf.references, desc(opts, "LSP: list references"))
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, desc(opts, "LSP: go to implementation"))

		vim.keymap.set("n", "K", vim.lsp.buf.hover, desc(opts, "LSP: hover documentation"))

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, desc(opts, "LSP: rename symbol"))
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, desc(opts, "LSP: code action"))
	end,
})
