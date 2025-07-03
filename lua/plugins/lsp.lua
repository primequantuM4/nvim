vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.dart",
    callback = function()
    end,
})

return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.install").compilers = { "clang" }

            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "python", "javascript", "dart", "typescript",
                    "c", "lua", "vim", "vimdoc"
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            -- LSP support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim",          opts = {} },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            {
                "hrsh7th/nvim-cmp",
                dependencies = {
                    "hrsh7th/cmp-nvim-lsp",
                    "L3MON4D3/LuaSnip",
                },
            }
        },
        config = function()
            require("lspconfig")
            local lsp = require("lsp-zero")
            lsp.preset("recommended")

            lsp.set_sign_icons({
                error = "X",
                warn = "▲",
                hint = "⚑",
                info = "»"
            })
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ts_ls",
                    "gopls",
                    "eslint",
                    "lua_ls",
                    "clangd",
                    "pyright",
                    --
                }
            })
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-space>"] = cmp.mapping.complete(),
            })
            lsp.setup_nvim_cmp({
                mapping = cmp_mappings,
            })
            lsp.on_attach(function(_, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gd", function()
                    vim.lsp.buf.definition()
                end, opts)
                vim.keymap.set("n", "K", function()
                    vim.lsp.buf.hover()
                end, opts)
                vim.keymap.set("n", "<leader>vws", function()
                    vim.lsp.buf.workspace_symbol()
                end, opts)
                vim.keymap.set("n", "<leader>vd", function()
                    vim.diagnostic.open_float()
                end, opts)
                vim.keymap.set("n", "[d", function()
                    vim.diagnostic.goto_next()
                end, opts)
                vim.keymap.set("n", "]d", function()
                    vim.diagnostic.goto_prev()
                end, opts)
                vim.keymap.set("n", "<leader>vca", function()
                    vim.lsp.buf.code_action()
                end, opts)
                vim.keymap.set("v", "<leader>vca", function()
                    vim.lsp.buf.code_action()
                end, opts)
                vim.keymap.set("n", "<leader>vrr", function()
                    vim.lsp.buf.references()
                end, opts)
                vim.keymap.set("n", "<leader>vrn", function()
                    vim.lsp.buf.rename()
                end, opts)
                vim.keymap.set("i", "<C-h>", function()
                    vim.lsp.buf.signature_help()
                end, opts)
            end)
            lsp.setup()
        end,
    },
    {
        'stevearc/conform.nvim',
        config = function()
            require("conform").setup({
                format_on_save = {
                    lsp_fallback = true, -- use LSP if no formatter is defined for a filetype
                    timeout_ms = 500,
                },
                formatters_by_ft = {
                    python = { "isort", "black" },
                    javascript = { "prettierd", "prettier" },
                    typescript = { "prettierd", "prettier" },
                },
                formatters = {
                    shfmt = {
                        prepend_args = { "-i", "2" },
                    },

                },
            })
        end,
    }
}
