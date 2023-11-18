local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup {
    pickers = {
        find_files = {
            previewer = false,
            theme = "ivy",
            mappings = {
                i = {
                    ['jk'] = actions.close,
                    ['<ESC>'] = actions.close,
                    ['<A-k>'] = actions.move_selection_previous,
                    ['<A-j>'] = actions.move_selection_next,
                    ['<A-l>'] = actions.select_default,
                },
            }
        },
        oldfiles = {
            previewer = false,
            theme = "ivy",
            mappings = {
                i = {
                    ['jk'] = actions.close,
                    ['<ESC>'] = actions.close,
                    ['<A-k>'] = actions.move_selection_previous,
                    ['<A-j>'] = actions.move_selection_next,
                    ['<A-l>'] = actions.select_default,
                },
            }
        },
        live_grep = {
            theme = "ivy",
            mappings = {
                i = {
                    ['jk'] = actions.close,
                    ['<ESC>'] = actions.close,
                    ['<A-k>'] = actions.move_selection_previous,
                    ['<A-j>'] = actions.move_selection_next,
                    ['<A-l>'] = actions.select_default,
                }
            }
        },
        buffers = {
            previewer = false,
            sort_lastused = true,
            theme = "ivy",
            mappings = {
                i = {
                    ['jk'] = actions.close,
                    ['<ESC>'] = actions.close,
                    ['<A-k>'] = actions.move_selection_previous,
                    ['<A-j>'] = actions.move_selection_next,
                    ['<A-l>'] = actions.select_default,

                    ['<A-d>'] = actions.delete_buffer,
                },
            }
        },
    },
}
-- find file from path
vim.keymap.set('n', '<leader>fF',
    function()
        local new_location = vim.fn.input("from -> ", vim.loop.cwd())
        if new_location == "" then
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
vim.keymap.set('n', '<leader>g', builtin.live_grep)
vim.keymap.set('n', '<leader>G',
    function()
        local new_location = vim.fn.input("from -> ", vim.loop.cwd())
        if new_location == "" then
            return;
        end
        builtin.live_grep { cwd = new_location }
    end)
