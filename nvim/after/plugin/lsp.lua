local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')

-- language servers
lsp_config.dartls.setup {}
lsp_config.rust_analyzer.setup {}
lsp_config.html.setup {}
lsp_config.gopls.setup {}
lsp_config.cssls.setup {}
lsp_config.pyright.setup {}
lsp_config.tsserver.setup {}
lsp_config.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- auto-completion
local cmp = require('cmp')
local luasnip = require("luasnip")
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
    mapping = {
        ['<A-l>'] = cmp.mapping.confirm { select = false },
        ["<A-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                if cmp.visible() then
                    cmp.select_next_item()
                end
            else
                fallback()
            end
        end, { "i" }),

        ["<A-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i" }),
    }
}
-- line error popup
vim.keymap.set("n", "<leader>o", vim.diagnostic.open_float)
