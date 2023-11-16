local isOpen = false
vim.keymap.set("n", "<leader>o",
    function()
        if isOpen then
            vim.cmd("ScratchPreview")
            isOpen = false
        else
            vim.cmd("Scratch")
            isOpen = true
        end
    end)

vim.g.scratch_persistence_file = "~/.config/nvim/scratch"
vim.g.scratch_autohide = 0
vim.g.scratch_top = 0
vim.g.scratch_height = 15
