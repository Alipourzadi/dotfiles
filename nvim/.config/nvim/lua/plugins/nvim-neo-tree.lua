return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
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
				width = 50,
				side = "left",
				signcolumn = "no",
			},
			renderer = {
				indent_markers = { enable = true },
				icons = {
					git_placement = "right_align",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						folder = {
							default = "󰉋",
							open = "",
							empty = "",
							arrow_closed = "",
							arrow_open = "",
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
	end,
}
