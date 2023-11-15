local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.load_extension("projects")
telescope.load_extension("frecency")

telescope.setup {
    pickers = {
        projects = {
            theme = "ivy",
        },
        find_files = {
            theme = "ivy",
        },
        buffers = {
            theme = "ivy",
            initial_mode = "normal",
            mappings = {
                n = {
                    ['dd'] = actions.delete_buffer
                }, -- n
            }
        },
        frecency = {
            theme = "ivy",
        }
    },
    defaults = {
        theme = "ivy",
        -- Default configuration for telescope goes here:
        -- config_key = value,
    }, -- defaults
    extensions = {
        frecency = {
            db_root = os.getenv('HOME') .. '/.config/nvim/db_root',
            ignore_patterns = { "oil:*" },
            disable_devicons = true,
            workspaces = {
            }
        }
    },
}
-- project find file
vim.keymap.set('n', '<leader>ff',
    function()
        location = vim.fn.input("from -> ./")
        builtin.find_files {
            cwd = require('telescope.utils').buffer_dir() .. "/" .. location
        }
    end)

vim.keymap.set('n', '<leader>,', builtin.buffers, {})

-- project search string
vim.keymap.set('n', '<leader>g',
    function()
        builtin.grep_string({
            cwd = require('telescope.utils').buffer_dir(),
            search = vim.fn.input("Grep -> ")
        })
    end
)
