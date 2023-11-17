local oil = require("oil")
oil.setup({
    keymaps = {
        ["<A-l>"] = "actions.select",
        ["<A-h>"] = "actions.parent",
        ["<CR>"] = "actions.select",
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
    oil.open()
end)

vim.keymap.set("n", "<leader>k", function()
    oil.open(vim.loop.cwd())
end)
