local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup {
    pickers = {
        find_files = {
            previewer = false,
        },
        oldfiles = {
            previewer = false,
        },
        live_grep = {
            previewer = true,
        },
        buffers = {
            previewer = false,
            sort_lastused = true,
            mappings = {
                i = {
                    ['<A-r>'] = actions.delete_buffer,
                },
            }
        },
    },
    defaults = vim.tbl_extend(
        "force",
        require('telescope.themes').get_ivy(), --
        {
            mappings = {
                i = {
                    ['jk'] = actions.close,
                    ['<ESC>'] = actions.close,
                    ['<A-k>'] = actions.move_selection_previous,
                    ['<A-j>'] = actions.move_selection_next,
                    ['<A-l>'] = actions.select_default,
                }
            }
        }
    )
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
