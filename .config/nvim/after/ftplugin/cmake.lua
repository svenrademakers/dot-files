vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
---- call formatter on save
--local cmake_group = vim.api.nvim_create_augroup('cmake_group', {clear = true})
--vim.api.nvim_create_autocmd('BufWritePre', {
--  pattern = {'<buffer>'},
--  group = cmake_group,
--  desc = 'cmake formatter on save',
--  command = ':CmakeFormat'
--})
