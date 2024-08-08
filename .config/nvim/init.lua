require("packert")
--vim.opt.ignorecase = true
vim.opt.mouse = 'n'
vim.go.cmdheight = 0
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 80
vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'
vim.o.smartcase = true
vim.bo.swapfile = false
vim.bo.smartindent = true
vim.o.expandtab = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.updatetime = 50
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.wrap = true
--vim.opt.syntax = 'on'
--vim.api.nvim_command('filetype plugin indent on')
----Set completeopt to have a better completion experience
---- :help completeopt
---- menuone: popup even when there's only one match
---- noinsert: Do not insert text until a selection is made
---- noselect: Do not select, force to select one from the menu
---- shortness: avoid showing extra messages when using completion
---- updatetime: set updatetime for CursorHold
--vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
--vim.opt.shortmess = vim.opt.shortmess + { c = true}
--vim.api.nvim_set_option('updatetime', 300)
--
---- Fixed column for diagnostics to appear
---- Show autodiagnostic popup on cursor hover_range
---- Goto previous / next diagnostic warning / error
---- Show inlay_hints more frequently
--vim.cmd([[
--set signcolumn=yes
--autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
--]])

---- colemak remaps
vim.g.mapleader = " "
vim.keymap.set('', 'm', 'h', { silent = true })
vim.keymap.set('', 'e', 'k', { silent = true })
vim.keymap.set('', 'i', 'l', { silent = true })
vim.keymap.set('', 'n', 'j', { silent = true })
-- extra insert key
vim.keymap.set('', 'l', 'i', { silent = true })
vim.keymap.set('', '<leader>e', 'e', { silent = true })
vim.keymap.set('', '<leader>m', 'm', { silent = true })
vim.keymap.set('', '<leader>i', 'i', { silent = true })
vim.keymap.set('', '<leader>n', 'n', { silent = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function(ev)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
