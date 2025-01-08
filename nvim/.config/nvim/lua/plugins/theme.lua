-- return {
--   "sainnhe/gruvbox-material",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.gruvbox_material_enable_italic = false
--     vim.g.gruvbox_material_transparent_background = 0
--     vim.g.gruvbox_material_float_style = "dim"
--     vim.g.gruvbox_material_statusline_style = "mix"
--     vim.g.gruvbox_material_background = "hard"
--
--     vim.cmd.colorscheme("gruvbox-material")
--   end,
-- }
-- lua/plugins/rose-pine.lua
--[[ return {
  "oxfist/night-owl.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("night-owl").setup({
      bold = true,
      italics = false,
      underline = true,
      undercurl = true,
      transparent_background = false,
    })
    vim.cmd.colorscheme("night-owl")
  end,
} ]]
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background = { light = "latte", dark = "mocha" },
			transparent_background = true,
			floating_border = true,
			show_end_of_buffer = true,
			term_colors = true,
			no_italic = true,
			no_bold = true,
			no_underline = true,
			default_integrations = true,
			integrations = {
				cmp = {
					enabled = true,
					border = {
						completion = true,
						documentation = true,
					},
				},
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
				indent_blankline = {
					enabled = true,
					scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
					colored_indent_levels = true,
				},
				alpha = true,
				treesitter = true,
				markdown = true,
				neotree = true,
				fidget = false,
				mason = true,
				window_picker = false,
				lsp_trouble = false,
				gitsigns = true,
				telescope = {
					enabled = true,
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
		-- local mocha = require("catppuccin.palettes").get_palette("mocha")

		-- =========================
		-- UI Elements
		-- =========================
		-- vim.api.nvim_set_hl(0, "Pmenu", { bg = mocha.base })
		-- vim.api.nvim_set_hl(0, "PmenuSel", { fg = mocha.text, bg = mocha.base, bold = true })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = mocha.base })
	end,
}
