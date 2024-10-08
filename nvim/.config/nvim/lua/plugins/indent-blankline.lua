return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    require("ibl").setup({
      exclude = {
        filetypes = { "help", "dashboard", "packer", "NvimTree", "Trouble", "TelescopePrompt", "Float" },
        buftypes = { "terminal", "nofile", "telescope" },
      },
      indent = {
        char = "│",
      },
      scope = {
        enabled = false,
        show_start = false,
      },
    })
  end,
}
