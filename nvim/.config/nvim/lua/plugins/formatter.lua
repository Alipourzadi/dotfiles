return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				python = { "black" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				toml = { "pyproject-fmt" },
				html = { "prettierd" },
				css = { "prettierd" },
				sh = { "beautysh" },
				zsh = { "beautysh" },
				astro = { "prettierd" },
			},
		})
		vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
-- return {
--   "nvimtools/none-ls.nvim",
--
--   config = function()
--     local null_ls = require("null-ls")
--     local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
--     local function format_on_save(client, bufnr)
--       if client.supports_method("textDocument/formatting") then
--         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--         vim.api.nvim_create_autocmd("BufWritePre", {
--           group = augroup,
--           buffer = bufnr,
--           callback = function()
--             vim.lsp.buf.format({ bufnr = bufnr })
--           end,
--         })
--       end
--     end
--
--     null_ls.setup({
--       on_attach = format_on_save,
--       sources = {
--         null_ls.builtins.formatting.stylua,    -- Lua formatter
--         null_ls.builtins.formatting.prettierd, -- JavaScript/TypeScript formatter
--         null_ls.builtins.formatting.black,     -- Python formatter
--       },
--     })
--
--     vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
--   end,
-- }
