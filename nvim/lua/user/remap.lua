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
        if (GetIsLspAttachedToCurrentBuffer()) then
            if (isCodeFormattingEnabled) then
                vim.lsp.buf.format({ async = false })
            end
            vim.cmd("w")
        else
            if (isCodeFormattingEnabled) then
                FormatBufferWithoutLsp()
            end
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
vim.keymap.set("c", "<S-BS>", "<C-W>")
vim.keymap.set("i", "<S-BS>", "<C-W>")

-- set cwd to current file directory
vim.keymap.set("n", "g.", "<CMD>cd %:p:h<CR>")
-- interactively cd relative to current file dir
vim.keymap.set("n", "g/",
    function()
        local new_cd_path = vim.fn.input("go to -> ", vim.loop.cwd())
        vim.cmd("cd " .. new_cd_path)
    end)
-- cd to last dir
vim.keymap.set("n", "g-", "<CMD>cd -<CR>")
