vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
-- call formatter on save
--local nix_group = vim.api.nvim_create_augroup('nix_group', {clear = true})
--vim.api.nvim_create_autocmd('BufWritePre', {
--  pattern = {'<buffer>'},
--  group = nix_group,
--  desc = 'cmake formatter on save',
--  command = 'silent! nixpkgs-fmt %'
--})
--vim.api.nvim_create_autocmd('BufWritePre', {
--  pattern = {'<buffer>'},
--  group = nix_group,
--  desc = 'cmake formatter on save',
--  command = 'edit'
--})
