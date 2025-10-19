return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup()
		vim.keymap.set("n", "<leader><leader>", "<cmd>ToggleTerm<cr>")
		vim.keymap.set("t", "<leader><leader>", "<cmd>ToggleTerm<cr>")
	end,
}
