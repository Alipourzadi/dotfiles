return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = { enabled = true },
			indent = { enabled = false },
			autotag = { enabled = false },
		})

		vim.treesitter.language.register("html", "ejs")
		vim.treesitter.language.register("javascript", "ejs")
	end,
}
