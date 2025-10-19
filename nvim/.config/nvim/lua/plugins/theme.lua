-- return {
-- 	"gthelding/monokai-pro.nvim",
-- 	config = function()
-- 		require("monokai-pro").setup({
-- 			filter = "ristretto",
-- 			override = function()
-- 				return {
-- 					NonText = { fg = "#948a8b" },
-- 					MiniIconsGrey = { fg = "#948a8b" },
-- 					MiniIconsRed = { fg = "#fd6883" },
-- 					MiniIconsBlue = { fg = "#85dacc" },
-- 					MiniIconsGreen = { fg = "#adda78" },
-- 					MiniIconsYellow = { fg = "#f9cc6c" },
-- 					MiniIconsOrange = { fg = "#f38d70" },
-- 					MiniIconsPurple = { fg = "#a8a9eb" },
-- 					MiniIconsAzure = { fg = "#a8a9eb" },
-- 					MiniIconsCyan = { fg = "#85dacc" }, -- same value as MiniIconsBlue for consistency
-- 				}
-- 			end,
-- 		})
-- 		vim.cmd([[colorscheme monokai-pro]])
-- 	end,
-- }

return {
	"erl-koenig/theme-hub.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Optional: for themes that use lush (will be notified if a theme requires it)
		"rktjmp/lush.nvim",
	},
	config = function()
		require("theme-hub").setup({
			-- Configuration options (see below)
			persistent = true,
		})
	end,
}
--[[ return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = {}, -- Change the style of comments
					conditionals = {},
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				default_integrations = true,
				integrations = {
					nvimtree = true,
					gitsigns = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
							ok = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
							ok = { "underline" },
						},
						inlay_hints = {
							background = true,
						},
					},
					treesitter = true,
				},
			})
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
} ]]
