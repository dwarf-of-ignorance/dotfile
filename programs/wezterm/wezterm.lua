local wezterm = require("wezterm")
local config = {}
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main
warn_about_missing_glyphs = false
config.enable_tab_bar = false
config.window_background_opacity = 0.9
config.default_cursor_style = "SteadyBar"
config.font_size = 14
config.enable_scroll_bar = true
config.font = wezterm.font_with_fallback {
  'MonoLisa',
}
config.window_decorations = "NONE"
config.enable_wayland = true
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.window_frame = {
	font = wezterm.font({ family = "MonoLisa" }),
}
return config
