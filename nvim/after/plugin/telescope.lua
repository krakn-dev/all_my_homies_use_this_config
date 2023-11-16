local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup {
    pickers = {
        find_files = {
            theme = "ivy",
            mappings = {
                i = {
                    ['<ESC>'] = actions.close,
                    ['<A-k>'] = actions.move_selection_previous,
                    ['<A-j>'] = actions.move_selection_next,
                    ['<A-l>'] = actions.select_default,

                    ['<left>'] = actions.nop,
                    ['<up>'] = actions.nop,
                    ['<down>'] = actions.nop,
                    ['<right>'] = actions.nop
                },
            }
        },
        oldfiles = {
            theme = "ivy",
            mappings = {
                i = {
                    ['<ESC>'] = actions.close,
                    ['<A-k>'] = actions.move_selection_previous,
                    ['<A-j>'] = actions.move_selection_next,
                    ['<A-l>'] = actions.select_default,

                    ['<left>'] = actions.nop,
                    ['<up>'] = actions.nop,
                    ['<down>'] = actions.nop,
                    ['<right>'] = actions.nop
                },
            }
        },
        buffers = {
            sort_lastused = true,
            theme = "ivy",
            mappings = {
                i = {
                    ['<ESC>'] = actions.close,
                    ['<A-k>'] = actions.move_selection_previous,
                    ['<A-j>'] = actions.move_selection_next,
                    ['<A-l>'] = actions.select_default,

                    ['<A-d>'] = actions.delete_buffer,

                    ['<left>'] = actions.nop,
                    ['<up>'] = actions.nop,
                    ['<down>'] = actions.nop,
                    ['<right>'] = actions.nop
                },
            }
        },
    },
}
-- find file from path
vim.keymap.set('n', '<leader>fF',
    function()
        local default_location = vim.loop.cwd()
        local new_location = vim.fn.input("from -> ", default_location)
        if new_location == default_location or
            new_location == ""
        then
            return;
        end
        builtin.find_files { cwd = new_location }
    end)

-- find file from current directory
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- buffers
vim.keymap.set('n', '<leader>,', builtin.buffers, {})

-- recent files
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})

-- search string
vim.keymap.set('n', '<leader>g',
    function()
        local grep_string = vim.fn.input("Grep -> ")
        if grep_string == "" then
            return;
        end
        builtin.grep_string({
            search = grep_string
        })
    end
)
