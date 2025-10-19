return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<c-b>]],
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			persist_mode = true,
			direction = "float",
			close_on_exit = true,
			clear_env = false,
			shell = vim.o.shell,
			auto_scroll = false, -- automatically scroll to the bottom on terminal output
			float_opts = {
				border = "curved",
			},
			responsiveness = {
				horizontal_breakpoint = 135,
			},
		})
		-- vim.keymap.set("n", "<leader><leader>", "<cmd>ToggleTerm<cr>")
		-- vim.keymap.set("t", "<leader><leader>", "<cmd>ToggleTerm<cr>")
	end,
}
