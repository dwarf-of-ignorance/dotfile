{
    lib,
        username,
        host,
        inputs,
        pkgs,
        config,
        ...
}:

    let
inherit (import ../hosts/${host}/variables.nix)
    browser
    terminal
    extraMonitorSettings
    ;
    in
    with lib;
{
    wayland.windowManager.sway= {
        enable = true;
        config.bars = [{
            position = "bottom";
            command = "waybar";
        }];
        systemd.enable = true;
        extraConfig =
            let
            mod = "Mod4";
        in
            concatStrings [ #python
            ''
            set $left h
            set $down j
            set $up k
            set $right l
            set $menu dmenu_run

            bindsym ${mod}+Return exec ${terminal}
            bindsym ${mod}+Shift+Return exec $menu
            bindsym ${mod}+w exec ${browser}
            floating_modifier ${mod} normal
            bindsym ${mod}+Shift+c reload

            bindsym ${mod}+Shift+w exec web-search
            bindsym ${mod}+ALT+w exec wallsetter
            bindsym ${mod}+Shift+n exec swaync-client -rs
            bindsym ${mod}+a exec screenshootin
            bindsym ${mod}+d exec discord
            bindsym ${mod}+o exec obs
            bindsym ${mod}+c exec hyprpicker -a
            bindsym ${mod}+g exec gimp
            bindsym ${mod}+Shift+g exec godot4
            bindsym ${mod}+t exec thunar
            bindsym ${mod}+Shift+q kill
# Exit sway (logs you out of your Wayland session)
            bindsym ${mod}+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'

# Moving around:
# Move your focus around
            bindsym ${mod}+$left focus left
            bindsym ${mod}+$down focus down
            bindsym ${mod}+$up focus up
            bindsym ${mod}+$right focus right
            bindsym ${mod}+Left focus left
            bindsym ${mod}+Down focus down
            bindsym ${mod}+Up focus up
            bindsym ${mod}+Right focus right
            bindsym ${mod}+Shift+$left move left
            bindsym ${mod}+Shift+$down move down
            bindsym ${mod}+Shift+$up move up
            bindsym ${mod}+Shift+$right move right
            bindsym ${mod}+Shift+Left move left
            bindsym ${mod}+Shift+Down move down
            bindsym ${mod}+Shift+Up move up
            bindsym ${mod}+Shift+Right move right
            bindsym ${mod}+1 workspace number 1
            bindsym ${mod}+2 workspace number 2
            bindsym ${mod}+3 workspace number 3
            bindsym ${mod}+4 workspace number 4
            bindsym ${mod}+5 workspace number 5
            bindsym ${mod}+6 workspace number 6
            bindsym ${mod}+7 workspace number 7
            bindsym ${mod}+8 workspace number 8
            bindsym ${mod}+9 workspace number 9
            bindsym ${mod}+0 workspace number 10
            bindsym ${mod}+Shift+1 move container to workspace number 1
            bindsym ${mod}+Shift+2 move container to workspace number 2
            bindsym ${mod}+Shift+3 move container to workspace number 3
            bindsym ${mod}+Shift+4 move container to workspace number 4
            bindsym ${mod}+Shift+5 move container to workspace number 5
            bindsym ${mod}+Shift+6 move container to workspace number 6
            bindsym ${mod}+Shift+7 move container to workspace number 7
            bindsym ${mod}+Shift+8 move container to workspace number 8
            bindsym ${mod}+Shift+9 move container to workspace number 9
            bindsym ${mod}+Shift+0 move container to workspace number 10
            bindsym ${mod}+f fullscreen
            bindsym ${mod}+Shift+space floating toggle
# Scratchpad:
            bindsym ${mod}+Shift+minus move scratchpad
            bindsym ${mod}+minus scratchpad show
## Volume
            bindsym XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ 
            bindsym	XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
            bindsym	XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            bindsym XF86AudioMicMute exec wpctl set-source-mute @DEFAULT_SOURCE@ toggle
            bindsym XF86MonBrightnessDown exec brightnessctl set 5%-
            bindsym XF86MonBrightnessUp exec brightnessctl set +5%
            ''
            ];
    };
}










