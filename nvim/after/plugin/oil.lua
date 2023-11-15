require("oil").setup({
	keymaps = {
		["L"] = "actions.select",
		["H"] = "actions.parent",
		["th"] = "actions.toggle_hidden",
	},
	delete_to_trash = true,
})
vim.keymap.set("n","<leader>.", function()vim.cmd("Oil")end)

