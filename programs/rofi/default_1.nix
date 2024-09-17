{ pkgs, config, ... }:

{
    programs = {
        rofi = {
            enable = true;
            package = pkgs.rofi-wayland;
            extraConfig = {
                modi = "drun";
                show-icons = true;
                icon-theme = "Papirus";
                location = 0;
                font = "JetBrainsMono Nerd Font Mono 12";
                drun-display-format = "{icon} {name}";
            };

            theme =
                let
                inherit (config.lib.formats.rasi) mkLiteral;
            in
            {
                "*" = {
                    background=     mkLiteral"#282828FF";
                    background-alt= mkLiteral"#353535FF";
                    foreground=     mkLiteral"#EBDBB2FF";
                    selected=       mkLiteral"#83A598FF";
                    active=         mkLiteral"#B8BB26FF";
                    urgent=         mkLiteral"#FB4934FF";
                };

                "window" = {
                    width = mkLiteral "500px";
                    transparency = "real";
                    cursor = mkLiteral "default";
                    border = mkLiteral "0px";
                    border-color = "@selected";
                    background-color = mkLiteral "@background";
                };
                "mainbox" = {
                    padding = mkLiteral "0px";
                    enabled = true;
                    children = map mkLiteral [
                        "inputbar"
                            "listview"
                    ];
                    background-color = mkLiteral "transparent";
                };
                "inputbar" = {
                    enabled = true;
                    padding = mkLiteral "15px";
                    margin = mkLiteral "0px";
                    background-color = mkLiteral "selected";
                    children= map mkLiteral[ 
                        "prompt"
                        "entry"
                    ];
                };
                "entry" = {
                    enabled = true;
                    background-color = mkLiteral "inherit";
                    text-color = mkLiteral "inherit";
                    cursor = mkLiteral "text";
                    placeholder = "Search... ";
                    placeholder-color = mkLiteral"inherit";
                };
                "listview" = {
                    enabled = true;
                    columns = 1;
                    lines = 6;
                    cycle = true;
                    dynamic = true;
                    scrollbar = false;
                    layout = mkLiteral "vertical";
                    reverse = false;
                    fixed-height = false;
                    fixed-columns = true;
                    spacing = mkLiteral "5px";
                    background-color = mkLiteral"transparent";
                    border = mkLiteral "0px";
                };
                "button" = {
                    width = mkLiteral "5%";
                    padding = mkLiteral "12px";
                    border-radius = mkLiteral "12px";
                    background-color = mkLiteral "@text-selected";
                    text-color = mkLiteral "@text-color";
                    cursor = mkLiteral "pointer";
                };
                "button selected" = {
                    background-color = mkLiteral "@selected";
                    text-color = mkLiteral "@text-selected";
                };
                "scrollbar" = {
                    handle-color = mkLiteral "@selected";
                    handle-width = mkLiteral "5px";
                };
                "element" = {
                    enabled = true;
                    spacing = mkLiteral "10px";
                    padding = mkLiteral "8px";
                    border-radius = mkLiteral "12px";
                    background-color = mkLiteral "transparent";
                    cursor = mkLiteral "pointer";
                };
                "element normal.normal" = {
                    background-color = mkLiteral "inherit";
                    text-color = mkLiteral "inherit";
                };
                "element selected.normal" = {
                    background-color = mkLiteral "@background-alt";
                    text-color = mkLiteral "@foreground";
                };
                "element-icon" = {
                    background-color = mkLiteral "transparent";
                    text-color = mkLiteral "inherit";
                    size = mkLiteral "32px";
                    cursor = mkLiteral "inherit";
                };
                "element-text" = {
                    background-color = mkLiteral "transparent";
                    text-color = mkLiteral "inherit";
                    cursor = mkLiteral "inherit";
                    vertical-align = mkLiteral "0.5";
                    horizontal-align = mkLiteral "0.0";
                };
                "textbox" = {
                    background-color = mkLiteral "@background";
                    text-color = mkLiteral "@foreground";
                    vertical-align = mkLiteral "0.5";
                    horizontal-align = mkLiteral "0.0";
                };
                "error-message" = {
                    padding = mkLiteral "15px";
                    background-color = mkLiteral "@bg-alt";
                    text-color = mkLiteral "@foreground";
                };
            };
        };
    };
}

