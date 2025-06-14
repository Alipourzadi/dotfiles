local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha (Gogh)"

config.font_size = 14
config.line_height = 1.2
config.font = wezterm.font_with_fallback({
	"FiraCode Nerd Font Propo",
	"Vazirmatn",
})

config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

config.animation_fps = 240

config.dpi = 96
config.window_decorations = "NONE"
config.enable_tab_bar = false
config.bidi_enabled = true
config.max_fps = 240

return config
