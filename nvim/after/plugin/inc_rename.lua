require("inc_rename").setup {
    cmd_name = "Rename", -- the name of the command
}

vim.keymap.set("n", "<leader>r", ":Rename ")
