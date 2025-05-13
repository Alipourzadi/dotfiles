return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup({
			exclude = {
				filetypes = {
					"telescope",
					"help",
					"dashboard",
					"packer",
					"NvimTree",
					"Trouble",
					"TelescopePrompt",
					"Float",
					"neo-tree",
				},
				buftypes = { "terminal", "nofile", "telescope" },
			},
			indent = {},
			scope = { enabled = false },
		})
	end,
}
