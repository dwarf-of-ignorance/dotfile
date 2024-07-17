{ pkgs, config, ... }:

{
    programs = {
        rofi = {
            enable = true;
            package = pkgs.rofi-wayland;
            extraConfig = {
                modi = "drun,filebrowser,run";
                show-icons = true;
                icon-theme = "Papirus";
                location = 0;
                font = "JetBrainsMono Nerd Font Mono 12";
            };
        };
    };
}
