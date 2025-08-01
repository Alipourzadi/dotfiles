local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha (Gogh)"

config.font_size = 14
config.font = wezterm.font_with_fallback({
	"0xProto Nerd Font Propo",
	"Vazirmatn",
})

config.window_padding = {
	left = 12,
	right = 12,
	top = 0,
	bottom = 0,
}

config.window_decorations = "NONE"
config.enable_tab_bar = false
config.bidi_enabled = true

return config
