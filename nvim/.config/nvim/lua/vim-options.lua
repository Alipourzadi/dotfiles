-- BASIC SETTINGS
local opt = vim.opt
local g = vim.g
local fn = vim.fn
local api = vim.api
local map = vim.keymap.set

opt.number = true
opt.relativenumber = false
opt.numberwidth = 3
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.wrap = false
opt.encoding = "utf-8"
opt.fillchars = { eob = " " }
opt.swapfile = false
opt.cursorline = true
opt.termguicolors = true
opt.termbidi = true
opt.linespace = 0

-- LEADER KEY
g.mapleader = " "

-- GUI SETTINGS
if g.neovide then
	opt.guifont = "JetBrainsMonoNL NF:h12"
	g.neovide_cursor_animate_in_insert_mode = false
end

-- KEY MAPPINGS
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-a>", "gg<S-v>G")
map("n", "<C-z>", "<Nop>")
map("n", "<leader>Y", "+Y", { silent = true })
map({ "n", "v" }, "<leader>y", "+y", { silent = true })
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { silent = true })
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
map("n", "<c-k>", "<cmd>wincmd k<CR>", { silent = true })
map("n", "<c-j>", "<cmd>wincmd j<CR>", { silent = true })
map("n", "<c-h>", "<cmd>wincmd h<CR>", { silent = true })
map("n", "<c-l>", "<cmd>wincmd l<CR>", { silent = true })
map("n", "<leader>xb", function()
	local current_buf = api.nvim_get_current_buf()
	for _, buf in ipairs(api.nvim_list_bufs()) do
		if buf ~= current_buf and api.nvim_buf_is_loaded(buf) then
			api.nvim_buf_delete(buf, {})
		end
	end
end, { silent = true })

-- LSP
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end)
vim.keymap.set("n", "<C-k>", function()
	vim.lsp.buf.signature_help({ border = "rounded" })
end)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

-- DIAGNOSTICS
map("n", "<leader>d]", vim.diagnostic.goto_next, { noremap = true, silent = true })
map("n", "<leader>d[", vim.diagnostic.goto_prev, { noremap = true, silent = true })
map("n", "<leader>do", vim.diagnostic.open_float, { noremap = true, silent = true })

-- CMDLINE RETURN FIX
map("c", "<CR>", function()
	return fn.getcmdtype() == "/" and "<CR>zzzv" or "<CR>"
end, { expr = true })

-- FILETYPE SETUP (Lazy)
local function setup_filetypes()
	g.filetype_config_loaded = true
	vim.filetype.add({
		extension = {
			mdx = "markdown.mdx",
		},
	})
end

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
	callback = function()
		if not g.filetype_config_loaded then
			setup_filetypes()
		end
	end,
})

-- JS LOG MACRO (Lazy)
local function setup_js_log_macro()
	g.js_config_loaded = true
	local esc = api.nvim_replace_termcodes("<Esc>", true, true, true)
	fn.setreg("l", "viwyoconsole.log('" .. esc .. "pa :'," .. esc .. "pa)")
end

api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
	callback = function()
		if not g.js_config_loaded then
			setup_js_log_macro()
		end
	end,
	group = api.nvim_create_augroup("JSLogMacro", { clear = true }),
})

-- Sort lines by width
vim.keymap.set("v", "<leader>zz", ":!awk '{ print length(), $0 | \"sort -n | cut -d\\  -f2-\" }'<CR>")
