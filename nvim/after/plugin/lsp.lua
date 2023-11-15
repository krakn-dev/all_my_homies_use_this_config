local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')

lsp_config.lua_ls.setup({
	settings = {
		Lua = {
		    diagnostics = {
			globals = { 'vim' }
		    }
		}
	    }
})
lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)


-- auto-completion
local cmp = require('cmp')
cmp.setup{
  mapping = {
    ['<CR>'] = cmp.mapping.confirm{select = false},
  }
}


