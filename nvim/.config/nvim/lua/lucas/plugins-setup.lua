-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local setup_packer, packer = pcall(require, "packer")
if not setup_packer then
    return
end

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Fuzzy Finder (files, lsp, etc)
    use {
        "nvim-telescope/telescope.nvim", branch = "0.1.x",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use("NTBBloodbath/doom-one.nvim")
    use("olimorris/onedarkpro.nvim")
    use({ "catppuccin/nvim", as = "catppuccin" })

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    -- Highlight, edit, and navigate code
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("nvim-treesitter/nvim-treesitter-context")

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' },   -- Optional
            { 'hrsh7th/cmp-path' },     -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional
            { "onsails/lspkind.nvim" }, -- vs-code like icons for autocompletion

            -- Snippets
            { 'L3MON4D3/LuaSnip' },         -- Required
            -- { 'rafamadriz/friendly-snippets' },
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
        }
    }

    use("folke/zen-mode.nvim")

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Useful plugin to show you pending keybinds.
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use("nvim-lualine/lualine.nvim")

    use("lukas-reineke/indent-blankline.nvim")

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use("norcalli/nvim-colorizer.lua")

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use("maxmellon/vim-jsx-pretty")

    use("windwp/nvim-autopairs")

    use("christoomey/vim-tmux-navigator")

    use("prisma/vim-prisma")

    use("andweeb/presence.nvim")
end)
