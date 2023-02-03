require('onedark').setup {
    style = 'cool',
    transparent = true,
    term_colors = true,
     lualine = {
        transparent = true, -- lualine center bar transparency
    }
}
require('onedark').load()
require('lualine').setup {
    options = {
        theme = 'onedark',
        section_separators = {
            left = '',
            right = ''
        },
        component_separators = {
            left = '',
            right = ''
        },
    },
    sections = {
        lualine_c = {
            {
                'filename',
                path = 3,
            },
        },
    }
}
vim.g['Powerline_symbols'] = 'fancy'
vim.cmd.colorscheme("onedark")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
require('bufferline').setup{
    options = {
        numbers = function(opts)
            return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
        end,
        indicator = {
            icon ='',
            style = 'none',
        },
        separator_style = { '', '' },
        diagnostics = "nvim_lsp"
    }
}
