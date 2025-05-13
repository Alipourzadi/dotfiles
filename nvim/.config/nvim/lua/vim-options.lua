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

-- KEY MAPPINGS
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-a>", "gg<S-v>G")
map("n", "<C-z>", "<Nop>")

--- copy to clipboard
map("n", "<leader>Y", "+Y", { silent = true })
map("v", "<leader>y", "+y", { silent = true })
map("n", "<leader>y", "+y", { silent = true })

-- toggle highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { silent = true })

-- rename selection in a buffer
map("n", "<leader>rn", ":%s/<c-r><c-w>/")

-- move lines
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

--- layout navigation
map("n", "<c-k>", "<cmd>wincmd k<CR>", { silent = true })
map("n", "<c-j>", "<cmd>wincmd j<CR>", { silent = true })
map("n", "<c-h>", "<cmd>wincmd h<CR>", { silent = true })
map("n", "<c-l>", "<cmd>wincmd l<CR>", { silent = true })

-- DIAGNOSTICS
map("n", "<leader>d]", vim.diagnostic.goto_next, { noremap = true, silent = true })
map("n", "<leader>d[", vim.diagnostic.goto_prev, { noremap = true, silent = true })
map("n", "<leader>do", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Sort lines by width
map("v", "<leader>zz", ":!awk '{ print length(), $0 | \"sort -n | cut -d\\  -f2-\" }'<CR>")

-- LSP
map("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end)
map("n", "<C-k>", function()
	vim.lsp.buf.signature_help({ border = "rounded" })
end)
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
map("n", "gr", vim.lsp.buf.references, {})
map("n", "gd", vim.lsp.buf.definition, {})

-- CMDLINE RETURN FIX
map("c", "<CR>", function()
	return fn.getcmdtype() == "/" and "<CR>zzzv" or "<CR>"
end, { expr = true })

-- close all buffers
map("n", "<leader>xb", function()
	local current_buf = api.nvim_get_current_buf()
	for _, buf in ipairs(api.nvim_list_bufs()) do
		if buf ~= current_buf and api.nvim_buf_is_loaded(buf) then
			api.nvim_buf_delete(buf, {})
		end
	end
end, { silent = true })

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
