--
-- LSP
 local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })

    --
    lsp_zero.buffer_autoformat()
    local opts = { buffer = bufnr }
    vim.keymap.set({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
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
-- cmp (auto completion)
local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({ details = true })
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
    },
    mapping = cmp.mapping.preset.insert({
        -- confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-c>'] = cmp.mapping.abort(),

        -- scroll up and down the documentation window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    }),
    -- always select first item in completion menu
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    --- (Optional) Show source name in completion menu
    formatting = cmp_format,
})
