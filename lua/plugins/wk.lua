vim.pack.add({
	"https://github.com/folke/which-key.nvim",
})

local wk = require("which-key")

-- Which-key has no on/off switch, so the toggle works through the delay:
-- when disabled the popup is pushed a day into the future, i.e. it never
-- appears on its own. `show()` passes its own delay, so <leader>? still works.
local DISABLED_DELAY = 24 * 60 * 60 * 1000

vim.g.which_key_disabled = false

wk.setup({
	delay = function(ctx)
		if vim.g.which_key_disabled then
			return DISABLED_DELAY
		end
		-- which-key's own default: instant for plugin popups, 200ms otherwise.
		return ctx.plugin and 0 or 200
	end,
})

wk.add({
	{ "<leader>a", group = "AI" },
	{ "<leader>c", group = "Copilot / Code" },
	{ "<leader>f", group = "Find" },
	{ "<leader>g", group = "Git" },
	{ "<leader>r", group = "Refactor" },
	{ "<leader>t", group = "Terminal" },
	{ "<leader>u", group = "UI / Toggles" },
})

vim.keymap.set("n", "<leader>?", function()
	wk.show({ global = true })
end, { desc = "Which-key: show all keymaps" })

vim.keymap.set("n", "<leader>uw", function()
	vim.g.which_key_disabled = not vim.g.which_key_disabled
	-- Close the popup if it happens to be open right now.
	require("which-key.view").hide()
	vim.notify("Which-key " .. (vim.g.which_key_disabled and "disabled" or "enabled"))
end, { desc = "Which-key: toggle auto popup" })
