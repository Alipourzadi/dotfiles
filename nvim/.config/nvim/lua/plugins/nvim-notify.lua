return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      render = "wrapped-compact",
      max_width = 35,
      timeout = 1000,
      top_down = true,
    })
  end,
}
