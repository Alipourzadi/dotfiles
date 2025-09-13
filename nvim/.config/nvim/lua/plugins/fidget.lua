return {
	"j-hui/fidget.nvim",
	config = function()
		require("fidget").setup({
			notification = {
				window = {
					winblend = 100,
					border = "rounded",
				},
			},
		})
	end,
}
