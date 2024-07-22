--
-- LSP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.set_sign_icons({
    error = '',
    warn = '',
    hint = '',
    info = '',
})

--
-- Mason
require("mason").setup()
require('mason-lspconfig').setup({
    handlers = {
        -- this first function is the "default handler"
        -- it applies to every language server without a "custom handler"
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})


--
-- manual format aanschoppen
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
