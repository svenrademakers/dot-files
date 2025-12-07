require("packert")
--vim.opt.ignorecase = true
vim.opt.mouse = 'a'
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
vim.g.mapleader = " "
vim.keymap.set('n', 'n', 'j', { silent = true }) -- down
vim.keymap.set('n', 'e', 'k', { silent = true }) -- up
vim.keymap.set('n', 'i', 'l', { silent = true }) -- right
vim.keymap.set('n', 'j', 'e', { silent = true }) -- end of word
vim.keymap.set('n', 'J', 'E', { silent = true }) -- end of word
vim.keymap.set('n', 'k', 'n', { silent = true }) -- next search
vim.keymap.set('n', 'K', 'N', { silent = true }) -- next search
vim.keymap.set('n', 'l', 'i', { silent = true }) -- insert
vim.keymap.set('n', 'L', 'I', { silent = true }) -- insert

---- extra remap
vim.keymap.set('n', '<leader>e', 'e', { silent = true })
vim.keymap.set('n', '<leader>i', 'i', { silent = true })
vim.keymap.set('n', '<leader>n', 'n', { silent = true })
-- Make `im` behave like `iw`
vim.keymap.set('o', 'im', 'iw')
vim.keymap.set('x', 'im', 'iw')  -- also for visual mode (viw → vim)
vim.keymap.set('n', 'l', 'c')
vim.keymap.set('o', 'l', 'c')

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function(ev)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

