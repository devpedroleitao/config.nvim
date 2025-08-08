-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'mfussenegger/nvim-jdtls'
    use 'wbthomason/packer.nvim'
    use 'laytan/cloak.nvim'
    use 'tpope/vim-surround'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "ellisonleao/gruvbox.nvim" }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        "pmizio/typescript-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}, }
    use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use('folke/neodev.nvim')

    use('WhoIsSethDaniel/mason-tool-installer.nvim')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim', tag = 'v1.32.0' },

            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            { 'aca/emmet-ls' },
            { 'hrsh7th/vscode-langservers-extracted' },
        }
    }

    use({
        "stevearc/conform.nvim",
    })

    use {
        "ray-x/lsp_signature.nvim",
    }

    use {
        'lewis6991/gitsigns.nvim'
    }

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            {
                's1n7ax/nvim-window-picker',
                version = '2.*',
                config = function()
                    require 'window-picker'.setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal', "quickfix" },
                            },
                        },
                    })
                end,
            },
        },
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- use {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({
    --             panel = {
    --                 keymap = {
    --                     open = "<C-Space>p",
    --                     jump_prev = "<C-p>",
    --                     jump_next = "<C-n>"
    --                 }
    --             },
    --             suggestion = {
    --                 auto_trigger = true,
    --                 keymap = {
    --                     accept = "<C-y>",
    --                     next = "<C-n>",
    --                     prev = "<C-p>",
    --                 }
    --             }
    --         })
    --     end,
    -- }
    --
    use {
        'github/copilot.vim',
    }

    use {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        requires = {
            -- { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { 'github/copilot.vim' },
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
    }

    use { 'tpope/vim-commentary' }
end)
