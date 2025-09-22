return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tailwindcss", "astro", "pyright", "bashls", "ts_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua_ls", {})
			vim.lsp.config("ts_ls", {})
			vim.lsp.config("tailwindcss", {})
			vim.lsp.config("astro", {})
			vim.lsp.config("pyright", {})
			vim.lsp.config("bashls", {})
		end,
	},
}
