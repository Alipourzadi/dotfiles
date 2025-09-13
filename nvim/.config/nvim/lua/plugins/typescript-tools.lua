return {
	"pmizio/typescript-tools.nvim",
	requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({
			settings = {
				tsserver_file_preferences = {
					preferTypeOnlyAutoImports = true,
					importModuleSpecifier = "relative",
				},
			},
		})
	end,
}
