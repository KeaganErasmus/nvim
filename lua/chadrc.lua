---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gruvbox",
}

-- vim.g.formatters = { typescript = "prettier" }

-- Set up an LSP attach callback to notify when LSP is ready
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			-- vim.notify(client.name .. " LSP is fully loaded!", vim.log.levels.INFO, { timeout = 3000 })
		end
	end,
})

M.plugins = {
	user = {
	},
}

return M
