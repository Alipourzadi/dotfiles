local cmd = vim.cmd
local set = vim.keymap.set
local opt = vim.opt

vim.g.mapleader = " "

cmd("nnoremap <C-z> <Nop>")
cmd("set encoding=utf-8")
cmd("set termbidi")
cmd("set expandtab")
cmd("set tabstop=2")
cmd("set softtabstop=2")
cmd("set shiftwidth=2")
cmd("set number")
cmd("set relativenumber")
cmd("set nowrap")
cmd("set cursorline")
cmd("set numberwidth=3")

-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = true

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

opt.fillchars = { eob = " " }
opt.swapfile = false
opt.termguicolors = true
opt.statuscolumn = "%s %l %r "

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.bo.filetype == "neo-tree" then
			vim.wo.statuscolumn = ""
		end
	end,
})

set("n", "<c-k>", ":wincmd k<CR>", { silent = true })
set("n", "<c-j>", ":wincmd j<CR>", { silent = true })
set("n", "<c-h>", ":wincmd h<CR>", { silent = true })
set("n", "<c-l>", ":wincmd l<CR>", { silent = true })
set("n", "<leader>rn", ":%s/<c-r><c-w>/")

set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
set("n", "<C-a>", "gg<S-v>G")

set("n", "<leader>y", '"+y', { silent = true })
set("v", "<leader>y", '"+y', { silent = true })
set("n", "<leader>Y", '"+Y', { silent = true })

set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("c", "<CR>", function()
	return vim.fn.getcmdtype() == "/" and "<CR>zzzv" or "<CR>"
end, { expr = true })

set("n", "<leader>h", ":nohlsearch<CR>", { silent = true })

set("n", "<leader>xb", function()
	local bufs = vim.api.nvim_list_bufs()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, i in ipairs(bufs) do
		if i ~= current_buf then
			vim.api.nvim_buf_delete(i, {})
		end
	end
end, { silent = true })

set("n", "<leader>i", function()
	-- If we find a floating window, close it.
	local found_float = false
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative ~= "" then
			vim.api.nvim_win_close(win, true)
			found_float = true
		end
	end

	if found_float then
		return
	end

	vim.diagnostic.open_float(nil, { border = "rounded", focus = false, scope = "cursor" })
end, { noremap = true, silent = true, desc = "Toggle Diagnostics" })

vim.filetype.add({
	extension = {
		mdx = "markdown.mdx",
	},
	filename = {},
	pattern = {},
})

if vim.g.neovide then
	-- vim.o.guifont = "JetBrainsMonoNL NF:h10"
	vim.o.guifont = "IntoneMono NF:h12"
	vim.opt.linespace = 0
	vim.g.neovide_cursor_animate_in_insert_mode = false
end
