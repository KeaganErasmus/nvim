vim.pack.add({

	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "ga", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "ge", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
