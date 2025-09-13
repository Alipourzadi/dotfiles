-- return {
-- 	"kyza0d/xeno.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {
-- 		transparent = false,
-- 		contrast = 0.1,
-- 	},
-- 	config = function(_, opts)
-- 		local xeno = require("xeno")
--
-- 		xeno.config(opts)
--
-- 		-- Create your custom theme
-- 		-- xeno.new_theme("xeno-lilypad", {
-- 		-- 	base = "#1E1E1E",
-- 		-- 	accent = "#8CBE8C",
-- 		-- })
-- 		xeno.new_theme("xeno-golden-hour", {
-- 			base = "#11111b",
-- 			accent = "#f5e0dc",
-- 			contrast = 0.1,
-- 		})
--
-- 		vim.cmd("colorscheme xeno-golden-hour")
-- 	end,
-- }
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				color_overrides = {
					mocha = { base = "#11111b", mantle = "#11111b", crust = "#11111b" },
				},
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
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
}
