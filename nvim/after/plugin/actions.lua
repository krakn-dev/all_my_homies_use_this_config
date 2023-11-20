local actions = require("actions-preview")
actions.setup {
    telescope = {
        theme = "ivy",
    },
}

vim.keymap.set("n", "<leader>a", actions.code_actions)
