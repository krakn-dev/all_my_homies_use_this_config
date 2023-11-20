require "lsp_signature".setup {
    doc_lines = 0,
    floating_window_off_x = -9999,
    floating_window_off_y = function()
        local window_height = vim.fn.winheight(0)
        local cursor_line = vim.fn.winline()
        return (window_height - cursor_line) + 1
    end,
    max_width = 9999,
    handler_opts = {
        border = "none" -- double, rounded, single, shadow, none, or a table of borders
    },
    hint_prefix = "-> ",
}
