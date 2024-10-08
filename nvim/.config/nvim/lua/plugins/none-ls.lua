return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local function format_on_save(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        -- Clear existing autocmds in the group to avoid duplicates
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

        -- Create a new autocmd to format the buffer before saving
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr }) -- Formats the current buffer
          end,
        })
      end
    end

    null_ls.setup({
      on_attach = format_on_save,
      sources = {
        null_ls.builtins.formatting.stylua,        -- Lua formatter

        null_ls.builtins.formatting.prettierd,     -- JavaScript/TypeScript formatter

        null_ls.builtins.formatting.gofumpt,       -- go formatter
        null_ls.builtins.formatting.goimports_reviser, -- go formatter
        null_ls.builtins.formatting.golines,       -- go formatter
      },
    })

    vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
  end,
}
