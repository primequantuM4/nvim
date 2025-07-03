return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme kanagawa")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("lualine").setup()
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        opts = {},
        event = "VeryLazy"
    },

    { "nvim-tree/nvim-web-devicons", opts = {} },
}
