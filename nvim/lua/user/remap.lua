vim.g.mapleader = " "

-- save buffer and format
function FormatBufferWithoutLsp()
    local save_view = vim.fn.winsaveview()
    vim.cmd "normal! gg=G"
    vim.fn.winrestview(save_view)
end

function GetIsLspAttachedToCurrentBuffer()
    if #vim.lsp.buf_get_clients(0) > 0 then
        return true
    end
    return false
end

local isCodeFormattingEnabled = true

vim.keymap.set("n", "<leader>fs",
    function()
        -- just save if is an oil buffer
        if string.find(vim.api.nvim_buf_get_name(0), "oil") then
            vim.cmd("w")
            return
        end

        if (GetIsLspAttachedToCurrentBuffer()) then
            if (isCodeFormattingEnabled) then
                vim.lsp.buf.format({ async = false })
            end
        else
            FormatBufferWithoutLsp()
        end

        if vim.api.nvim_buf_get_name(0) == "" then
            -- save for unnamed buffers
            local file_name = vim.fn.input("new file name -> ")
            if file_name == "" then
                return;
            end
            vim.cmd("w " .. file_name)
        else
            vim.cmd("w")
        end
    end)

-- open and select lsp on ]
-- toggle code formatting
vim.keymap.set("n", "<leader>cf",
    function()
        if (isCodeFormattingEnabled) then
            isCodeFormattingEnabled = false
        else
            isCodeFormattingEnabled = true
        end
    end)

-- quit
vim.keymap.set("n", "<leader>wq", function() vim.cmd("q") end)
-- force quit
vim.keymap.set("n", "<leader>wQ", function() vim.cmd("q!") end)
-- save all
vim.keymap.set("n", "<leader>fS", function() vim.cmd("wa") end)

-- remove current buffer
vim.keymap.set("n", "<leader>bd", function() vim.cmd("bw") end)
-- force remove current buffer
vim.keymap.set("n", "<leader>bD", function() vim.cmd("bw!") end)
-- new empty buffer
vim.keymap.set("n", "<leader>bn", function() vim.cmd("enew") end)

-- paste without copying
vim.keymap.set("x", "p", "\"_dP")

-- yank to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
-- paste from system clipboard
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")

-- move between open buffers
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
-- move open buffers
vim.keymap.set("n", "<leader>wH", "<C-w>H")
vim.keymap.set("n", "<leader>wJ", "<C-w>J")
vim.keymap.set("n", "<leader>wK", "<C-w>K")
vim.keymap.set("n", "<leader>wL", "<C-w>L")
-- move buffer to its own tab
vim.keymap.set("n", "<leader>wf", "<C-w>T")


-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- half page jump while keeping the
-- cursor in the middle
vim.keymap.set("n", "<a-j>", "<C-d>zz")
vim.keymap.set("n", "<a-k>", "<C-u>zz")

-- for visual mode
vim.keymap.set("v", "<a-j>", "<C-d>zz")
vim.keymap.set("v", "<a-k>", "<C-u>zz")

-- same as J but not shifting the cursor
vim.keymap.set("n", "J", "mzJ`z")

-- delete without yanking
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("n", "<leader>D", "\"_dd")

-- ?? why
vim.keymap.set("v", "Q", "<nop>")

-- delete word in insert
vim.keymap.set("c", "<C-BS>", "<C-W>")
vim.keymap.set("i", "<C-BS>", "<C-W>")
vim.keymap.set("c", "<S-BS>", "<C-W>")
vim.keymap.set("i", "<S-BS>", "<C-W>")


-- go next matching word in top of cursor
vim.keymap.set("n", "gn", "*")

-- set cwd to current file directory
vim.keymap.set("n", "g.",
    function()
        local new_cd_path = vim.fn.input("go to -> ", vim.fn.expand("%:p:h"))
        if new_cd_path == "" then
            return
        end
        vim.cmd("cd " .. new_cd_path)

        vim.cmd("echo ''")
    end)
-- interactively cd relative to current file dir
vim.keymap.set("n", "g/",
    function()
        local new_cd_path = vim.fn.input("go to -> ", vim.loop.cwd())
        if new_cd_path == "" then
            return
        end
        vim.cmd("cd " .. new_cd_path)

        vim.cmd("echo ''")
    end)
-- cd to last dir
vim.keymap.set("n", "g-", "<CMD>cd -<CR>")

-- fold/unfold with tab
vim.keymap.set("n", "<A-Tab>", "za")

-- go to other pair
vim.keymap.set("n", "<Tab>", "%")

-- remap enter command mode
vim.keymap.set("c", "<A-l>", "<CR>")
-- remap arrow keys
vim.keymap.set("c", "<A-k>", "<Up>")
vim.keymap.set("c", "<A-j>", "<Down>")

-- remap arrow keys insert
vim.keymap.set("i", "<A-l>", "<Right>")
vim.keymap.set("i", "<A-h>", "<Left>")
vim.keymap.set("i", "<A-k>", "<Up>")
vim.keymap.set("i", "<A-j>", "<Down>")
