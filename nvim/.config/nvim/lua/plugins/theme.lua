return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      floating_border = true,
      show_end_of_buffer = false,
      term_colors = true,
      no_italic = true,
      no_bold = false,
      no_underline = false,
      default_integrations = true,
      integrations = {
        cmp = {
          enabled = true,
          border = {
            completion = true,
            documentation = true,
          },
        },
        treesitter = true,
        neotree = true,
        fidget = true,
        mason = true,
        telescope = {
          enabled = true,
        },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
