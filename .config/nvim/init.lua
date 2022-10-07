-- theme Setup
require('theme')

-- vim Options
--vim.o.termguicolors = true
vim.opt.ignorecase = true
vim.opt.mouse = 'n'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.o.smartcase = true
vim.bo.swapfile = false
vim.bo.smartindent = true
vim.o.expandtab = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false
vim.opt.syntax = 'on'
vim.api.nvim_command('filetype plugin indent on')
--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

require('plugins')
require('rust_lsp')


-- set telescope fuzzy find shortcuts
vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
vim.keymap.set('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
vim.keymap.set('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
vim.keymap.set('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")

vim.keymap.set('n', '<c-p>', "<cmd>lua require('telescope.builtin').find_files() hidden=true<CR>")
vim.keymap.set('n', '<c-f>', "<cmd>lua require('telescope.builtin').grep_string()<cr>")
vim.keymap.set('n', '<c-F>', "<cmd>lua require('telescope.builtin').live_grep()<cr>")

vim.keymap.set('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
vim.keymap.set('n', 'gD', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
vim.keymap.set('n', 'gW', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>")
vim.keymap.set('n', 'g0', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")
vim.keymap.set('n', 'ge', "<cmd>lua require('telescope.builtin').diagnostics()<cr>")
vim.keymap.set('n', 'gi', "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>")
vim.keymap.set('n', 'gtd', "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>")
vim.keymap.set('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
vim.keymap.set('n','ga', '<cmd> lua vim.lsp.buf.code_action()<CR>', { silent = true })

-- auto-pairs
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
