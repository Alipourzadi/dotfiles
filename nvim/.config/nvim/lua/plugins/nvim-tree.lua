return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set("n", "w", api.node.open.edit, opts("Refresh"))
		end

		require("nvim-tree").setup({
			on_attach = my_on_attach,
			hijack_cursor = true,
			view = {
				width = 40,
				side = "left",
				signcolumn = "no",
			},
			renderer = {
				highlight_diagnostics = "name",
				indent_markers = { enable = true },
				highlight_git = true, -- makes git ignored files use highlights
				icons = {
					git_placement = "right_align",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = false,
					},
					glyphs = {
						folder = {
							default = "",
							open = "",
							empty = "+",
							empty_open = "-",
							arrow_closed = "",
							arrow_open = "",
						},
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "󰁕",
							untracked = "✚",
							deleted = "✖",
							ignored = "",
						},
					},
				},
			},
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			git = {
				enable = true,
				ignore = false,
			},
			filters = {
				dotfiles = false,
				git_clean = false,
			},
			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = true,
					window_picker = {
						enable = true,
					},
				},
			},
		})

		-- Toggle tree with <C-n>
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })

		-- Increase NvimTree width by 5
		vim.keymap.set("n", "<C-Right>", ":NvimTreeResize +5<CR>", { silent = true, desc = "Increase NvimTree width" })

		-- Decrease NvimTree width by 5
		vim.keymap.set("n", "<C-Left>", ":NvimTreeResize -5<CR>", { silent = true, desc = "Decrease NvimTree width" })

		vim.cmd([[highlight NvimTreeErrorFile guifg=#ff0000 gui=bold]])
	end,
}
