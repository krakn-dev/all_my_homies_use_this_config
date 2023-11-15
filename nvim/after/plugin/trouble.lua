local trouble = require("trouble")
trouble.setup {
    icons = false,
}
-- open error list
vim.keymap.set("n", "<leader>co",
    function()
        trouble.toggle()
    end)

-- open error list
vim.keymap.set("n", "<leader>n",
    function()
        trouble.next { skip_groups = true, jump = true }
    end)
