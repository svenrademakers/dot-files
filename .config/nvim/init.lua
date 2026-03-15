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

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function(ev)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

