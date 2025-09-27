require('onedark').setup {
  style = 'cool',
  transparent = true,
  term_colors = true,
  lualine = {
    transparent = true, -- lualine center bar transparency
  }
}
require('onedark').load()

-- Helper to clip strings to a max length with an ellipsis.
local function clip(str, max)
  if not str or str == '' then return '' end
  max = max or 20
  if #str > max then
    return string.sub(str, 1, max - 1) .. '…'
  end
  return str
end

require('lualine').setup {
  options = {
    theme = 'onedark',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  },
  sections = {
    -- Show truncated git branch here
    lualine_b = {
      {
        'branch',
        icon = '',
        fmt = function(name) return clip(name, 20) end, -- adjust 20 as you like
      },
    },
    lualine_c = {
      {
        'filename',
        path = 3,
      },
    },
  },
}

vim.g['Powerline_symbols'] = 'fancy'
vim.cmd.colorscheme("onedark")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Bufferline
require('bufferline').setup {
    options = {
        numbers = function(opts)
            return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
        end,
        indicator = {
            icon = '',
            style = 'none',
        },
        separator_style = { '', '' },
        diagnostics = "nvim_lsp",
    }
}
