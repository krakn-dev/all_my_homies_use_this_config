require("harpoon").setup({
    tabline = true,
})


local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>ho", ui.toggle_quick_menu)
vim.keymap.set("n", "<A-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<A-2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<A-3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<A-4>", function() ui.nav_file(4) end)


vim.cmd('highlight! HarpoonActive guibg=#1C1A1A guifg=#ACC784')
vim.cmd('highlight! HarpoonInactive guibg=#1C1A1A guifg=#736777')

vim.cmd('highlight! HarpoonNumberActive guibg=#1C1A1A guifg=#bc9bbf')
vim.cmd('highlight! HarpoonNumberInactive guibg=#1C1A1A guifg=#bc9bbf')

vim.cmd('highlight! TabLineFill guibg=#1C1A1A guifg=NONE')
