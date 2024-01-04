require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		dart = { "ast-grep" },
		css = { { "prettierd", "prettier" } },
		go = { { "goimports", "gofumpt" } },
		xml = { "xmlformatter" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
