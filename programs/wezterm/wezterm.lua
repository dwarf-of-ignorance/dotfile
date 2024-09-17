local wezterm = require("wezterm")
local config = {}
config.color_scheme = "Gruvbox dark, hard (base16)"
warn_about_missing_glyphs = false
config.enable_tab_bar = false
config.tab_bar_at_bottom = false
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.9
config.default_cursor_style = "SteadyBar"
config.font_size = 14
config.enable_scroll_bar = true
config.font = wezterm.font_with_fallback {
  'JetBrains Mono Nerd Font',
}
config.window_decorations = "NONE"
config.enable_wayland = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.window_frame = {
	font = wezterm.font({ family = "Fira Code" }),
}
return config
