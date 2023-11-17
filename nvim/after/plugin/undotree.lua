vim.keymap.set("n", "<leader>u",
    function()
        vim.cmd.UndotreeToggle()
    end)
vim.g.undotree_WindowLayout = 2
vim.g.undotree_TreeNodeShape = '+'
vim.g.undotree_SetFocusWhenToggle = 1

vim.cmd([[
function! g:Undotree_CustomMap()
    map <buffer> <A-l> <CR>
    map <buffer> gg 3G
endfunction
]])
