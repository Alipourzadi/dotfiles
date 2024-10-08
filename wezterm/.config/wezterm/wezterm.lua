local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font_size = 9.8
config.line_height = 1.3
config.font = wezterm.font_with_fallback({
	"FiraCode Nerd Font Med",
	"IRANYekanXFaNum DemiBold",
})

config.window_padding = {
	left = 8,
	right = 8,
	top = 6,
	bottom = 0,
}

config.keys = {
	{ key = "i", mods = "CTRL", action = wezterm.action({ SendString = "\x09" }) },
	{ key = "i", mods = "CTRL|SHIFT", action = wezterm.action({ SendString = "\x09" }) },
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}
config.window_decorations = "NONE"
config.window_background_opacity = 0.95
config.enable_tab_bar = false

config.bidi_enabled = true

return config
