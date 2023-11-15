require("harpoon").setup({
    tabline = true,
    save_on_toggle = true,
})


local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


vim.keymap.set("n", "<leader>ha",
    function()
        mark.add_file()
        vim.cmd("w")
    end)
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu)
vim.keymap.set("n", "<A-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<A-2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<A-3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<A-4>", function() ui.nav_file(4) end)
vim.keymap.set("n", "<A-5>", function() ui.nav_file(5) end)
vim.keymap.set("n", "<A-6>", function() ui.nav_file(6) end)
vim.keymap.set("n", "<A-7>", function() ui.nav_file(7) end)
vim.keymap.set("n", "<A-8>", function() ui.nav_file(8) end)
vim.keymap.set("n", "<A-9>", function() ui.nav_file(9) end)


vim.cmd('highlight! HarpoonActive guibg=#1C1A1A guifg=#ACC784')
vim.cmd('highlight! HarpoonInactive guibg=#1C1A1A guifg=#736777')

vim.cmd('highlight! HarpoonNumberActive guibg=#1C1A1A guifg=#bc9bbf')
vim.cmd('highlight! HarpoonNumberInactive guibg=#1C1A1A guifg=#bc9bbf')

vim.cmd('highlight! TabLineFill guibg=#1C1A1A guifg=NONE')
