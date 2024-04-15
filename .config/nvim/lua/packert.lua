return require('packer').startup(function(use)
    --
    -- layout and cosmetics
    --
    use 'navarasu/onedark.nvim'
    use 'wbthomason/packer.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }
    use 'preservim/nerdtree'

    --
    -- pickers and finders:
    --
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'BurntSushi/ripgrep'
    use 'sharkdp/fd'
    use 'ThePrimeagen/harpoon'

    --
    --tree sitter
    --
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    --justfile treesitter
    use "IndianBoy42/tree-sitter-just"
    use 'NoahTheDuke/vim-just'
    use {
        'weirongxu/plantuml-previewer.vim',
        requires = {
            { 'tyru/open-browser.vim' },
            { 'aklt/plantuml-syntax' },
        }
    }

    --
    --LSP
    --
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    --
    -- markdown processor
    --
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }

    --
    -- Plantuml plantuml-previewer
    --
    use {
        "weirongxu/plantuml-previewer.vim",
        requires = { { 'tyru/open-browser.vim' } }
    }
end)
