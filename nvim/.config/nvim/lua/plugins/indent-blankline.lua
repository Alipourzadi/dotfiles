return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    require("ibl").setup({
      exclude = {
        filetypes = {
          "telescope",
          "help",
          "dashboard",
          "packer",
          "NvimTree",
          "Trouble",
          "TelescopePrompt",
          "Float",
          "neo-tree",
        },
        buftypes = { "terminal", "nofile", "telescope" },
      },
      indent = {
        char = ".",
        smart_indent_cap = true,
        repeat_linebreak = true,
      },
      scope = {
        enabled = false,
        show_start = false,
      },
    })
  end,
}
