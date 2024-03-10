return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'sainnhe/everforest'


    use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
    }



    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    
    
    use 'folke/tokyonight.nvim'

    use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    })

    use 'voldikss/vim-floaterm'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use  'skywind3000/asyncrun.vim'

    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    use { 'nvim-treesitter/nvim-treesitter'}

    use 'm4xshen/autoclose.nvim'

    use {
        'numToStr/Comment.nvim',
        config = function()
        require('Comment').setup()
    end
    }

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()

        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
        end
    })
    
    use { 'rainbowhxch/accelerated-jk.nvim' }


end)

