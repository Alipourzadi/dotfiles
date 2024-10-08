return {
	"lewis6991/gitsigns.nvim",
	name = "gitsigns",
	config = function()
		require("gitsigns").setup()
		vim.keymap.set("n", "<leader>ph", ":Gitsigns preview_hunk<CR>", { silent = true })
	end,
}
