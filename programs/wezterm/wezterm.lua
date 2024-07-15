local wezterm = require("wezterm")
local config = {}
config.color_scheme = "Gruvbox dark, hard (base16)"
config.enable_tab_bar = false
config.tab_bar_at_bottom = false
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.9
config.default_cursor_style = "SteadyBar"
config.font_size = 14
config.enable_scroll_bar = true
config.window_decorations = "NONE"
config.enable_wayland = false
config.window_frame = {
	font = wezterm.font({ family = "Fira Code" }),
}
return config
