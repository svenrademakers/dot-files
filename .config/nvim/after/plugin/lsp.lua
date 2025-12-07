
vim.lsp.config.typescript_server = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'typescript-language-server', '--stdio'},
    filetypes = { 'typescript' },
    root_markers = {"package.json", ".git"},
}
vim.lsp.enable('typescript_server')

vim.lsp.config.rust_analyzer = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = {"Cargo.toml", ".git"},
    single_file_support = true,
    before_init = function(init_params, config)
        -- See https://github.com/rust-lang/rust-analyzer/blob/eb5da56d839ae0a9e9f50774fa3eb78eb0964550/docs/dev/lsp-extensions.md?plain=1#L26
        if config.settings and config.settings['rust-analyzer'] then
            init_params.initializationOptions = config.settings['rust-analyzer']
        end
    end,
}

vim.lsp.enable('rust_analyzer')

vim.lsp.inlay_hint.enable(true)

vim.keymap.set("n", "<leader>ie", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

local signs = {
  Error = " ",
  Warn  = " ",
  Hint  = "󰌶 ",
  Info  = " ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Enable format on save only for Rust files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
