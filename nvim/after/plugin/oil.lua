require("oil").setup({
    keymaps = {
        ["L"] = "actions.select",
        ["H"] = "actions.parent",
        ["}"] = "actions.select",
        ["{"] = "actions.parent",
        ["<CR>"] = "actions.select",
        ["g."] = "actions.cd",
        ["gh"] = "actions.show_help",
        ["th"] = "actions.toggle_hidden",
        ["tt"] = "actions.toggle_trash",
        ["<BS>"] = "actions.close",
        ["<ESC>"] = "actions.close",
    },
    use_default_keymaps = false,
    delete_to_trash = true,
})
vim.keymap.set("n", "<leader>.", function()
    vim.cmd("Oil")
end)
