{
  pkgs,
  lib,
  host,
  config,
  ...
}:

let
  inherit (import ../hosts/${host}/variables.nix) clock24h;
in
with lib;
{
  # Configure & Theme Waybar
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "bottom";
        position = "bottom";
        modules-center = [ ];
        modules-left = [
            "hyprland/workspaces" 
            "hyprland/window"
            "sway/workspaces" 
            "sway/window"
        ];
        modules-right = [
          "cpu"
          "memory"
          "custom/notification"
          "custom/exit"
          "pulseaudio"
          "battery"
          "tray"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        "sway/workspaces" = {
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        "hyprland/window" = {
          max-length = 22;
          separate-outputs = false;
          rewrite = {
            "" = "empty";
          };
        };
        "sway/window" = {
          max-length = 22;
          separate-outputs = false;
          rewrite = {
            "" = "empty";
          };
        };
        "clock" = {
          format = if clock24h == true then '' {:L%H:%M}'' else '' {:L%I:%M %p}'';
          tooltip = true;
          tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
        };
        "memory" = {
          interval = 5;
          format = " {}%";
          tooltip = true;
        };
        "cpu" = {
          interval = 5;
          format = " {usage:2}%";
          tooltip = true;
        };
        "disk" = {
          format = " {free}";
          tooltip = true;
        };
        "network" = {
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-ethernet = " {bandwidthDownOctets}";
          format-wifi = "{icon} {signalStrength}%";
          format-disconnected = "󰤮";
          tooltip = false;
        };
        "tray" = {
          spacing = 12;
        };
        "pulseaudio" = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "sleep 0.1 && pavucontrol";
        };
        "custom/exit" = {
          tooltip = false;
          format = "";
          on-click = "sleep 0.1 && wlogout";
        };
        "custom/notification" = {
          tooltip = false;
          format = "{icon} {}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && task-waybar";
          escape = true;
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󱘖 {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          on-click = "";
          tooltip = false;
        };
      }
    ];

    style = concatStrings [ #css
      ''
        * {
          font-family: JetBrainsMono Nerd Font Mono;
          font-size: 16px;
          border: none;
          min-height: 0px;
        }
        window#waybar {
          background: rgba(0,0,0,0);
        }
        #workspaces {
          color: #${config.stylix.base16Scheme.base00};
          background: #${config.stylix.base16Scheme.base01};
          margin: 4px 4px;
          padding: 5px 5px;
        }
        #workspaces button {
          font-weight: bold;
          padding: 0px 5px;
          margin: 0px 3px;
          color: #${config.stylix.base16Scheme.base00};
          background: #${config.stylix.base16Scheme.base0F};
          opacity: 0.5;
        }
        #workspaces button.active {
          font-weight: bold;
          padding: 0px 5px;
          margin: 0px 3px;
          color: #${config.stylix.base16Scheme.base00};
          background: #${config.stylix.base16Scheme.base0F};
          opacity: 1.0;
          min-width: 40px;
        }
        #workspaces button.focused{
          font-weight: bold;
          padding: 0px 5px;
          margin: 0px 3px;
          color: #${config.stylix.base16Scheme.base00};
          background: #${config.stylix.base16Scheme.base0F};
          opacity: 1.0;
          min-width: 40px;
        }
        #workspaces button:hover {
          font-weight: bold;
          color: #${config.stylix.base16Scheme.base00};
          background: #${config.stylix.base16Scheme.base0F};
          opacity: 0.8;
        }
        tooltip {
          background: #${config.stylix.base16Scheme.base00};
          border: 1px solid #${config.stylix.base16Scheme.base08};
        }
        tooltip label {
          color: #${config.stylix.base16Scheme.base08};
        }
        #custom-startmenu {
          color: #${config.stylix.base16Scheme.base0B};
          background: #${config.stylix.base16Scheme.base02};
          font-size: 28px;
          margin: 0px;
          padding: 0px 30px 0px 15px;
        }
          #network,  #memory ,#battery,
          #custom-exit ,#clock{
          font-weight: bold;
          background: #${config.stylix.base16Scheme.base0F};
          color: #${config.stylix.base16Scheme.base00};
          margin: 4px 0px;
          padding: 0px 18px;
        }
        #window, #custom-notification, #pulseaudio, #tray ,#cpu, #idle_inhibitor {
          font-weight: bold;
          margin: 4px 0px;
          padding: 0px 18px;
          background: #${config.stylix.base16Scheme.base04};
          color: #${config.stylix.base16Scheme.base00};
        }
      ''
    ];
  };
}

