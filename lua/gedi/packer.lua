-- This file can be loaded by calling `lua require('plugins')` from your init.vim``
-- Only required if you have packer configured as `opt`
-- vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({
        "folke/tokyonight.nvim",
        as = "tokyonight",
        config = function()
            vim.cmd("colorscheme tokyonight-moon")
        end,
    })
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },             -- Required
            { "williamboman/mason.nvim" },           -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },     -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" },     -- Required
        },
    })
    use("stevearc/dressing.nvim")
    use({
        "akinsho/flutter-tools.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    -- use({
    --     "nvim-tree/nvim-tree.lua",
    --     requires = {
    --         "nvim-tree/nvim-web-devicons", -- optional
    --     },
    -- })
    use("nvim-tree/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim")
    use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" } })
    use("CRAG666/code_runner.nvim")
    use("p00f/cphelper.nvim")
    use({
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup({})
        end,
    })
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    use({ "mfussenegger/nvim-jdtls", ft = { "java" } })
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("toggleterm").setup()
        end,
    })
    use("lewis6991/gitsigns.nvim") -- OPTIONAL: for git status
    -- use("romgrk/barbar.nvim")
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })
    use({ "catppuccin/nvim", as = "catppuccin" })
    use({
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    })
    use({ "ThePrimeagen/vim-be-good" })
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    })
    use "github/copilot.vim"
    use({ 'rose-pine/neovim', as = 'rose-pine' })
end)

