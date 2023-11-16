require("oil").setup({
    keymaps = {
        ["<A-l>"] = "actions.select",
        ["<A-h>"] = "actions.parent",
        ["g."] = "actions.cd",
        ["gh"] = "actions.show_help",
        ["th"] = "actions.toggle_hidden",
        ["tt"] = "actions.toggle_trash",
        ["<ESC>"] = "actions.close",
    },
    use_default_keymaps = false,
    delete_to_trash = true,
})
vim.keymap.set("n", "<leader>j", function()
    vim.cmd("Oil")
end)
