local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup {
    pickers = {
        find_files = {
            theme = "ivy",
            mappings = {
                i = {
                    ['<S-BS>'] = actions.close,
                    ['<A-[>'] = actions.move_selection_previous,
                    ['<A-]>'] = actions.move_selection_next,

                    ['<ESC>'] = actions.close,
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
                    ['<S-BS>'] = actions.close,
                    ['<A-[>'] = actions.move_selection_previous,
                    ['<A-]>'] = actions.move_selection_next,

                    ['<ESC>'] = actions.close,
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
                    ['<S-BS>'] = actions.close,
                    ['<A-[>'] = actions.move_selection_previous,
                    ['<A-]>'] = actions.move_selection_next,

                    ['<ESC>'] = actions.close,
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
        builtin.grep_string({
            search = vim.fn.input("Grep -> ")
        })
    end
)
