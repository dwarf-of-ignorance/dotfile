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
        display-drun = "";
      };
      theme =
        let
          inherit (config.lib.formats.rasi) mkLiteral;
        in
        {
          "*" = {
            bg = mkLiteral "#${config.stylix.base16Scheme.base00}";
            bg-alt = mkLiteral "#${config.stylix.base16Scheme.base09}";
            foreground = mkLiteral "#${config.stylix.base16Scheme.base01}";
            selected = mkLiteral "#${config.stylix.base16Scheme.base08}";
            active = mkLiteral "#${config.stylix.base16Scheme.base0B}";
            text-selected = mkLiteral "#${config.stylix.base16Scheme.base00}";
            text-color = mkLiteral "#${config.stylix.base16Scheme.base05}";
            border-color = mkLiteral "#${config.stylix.base16Scheme.base0F}";
            urgent = mkLiteral "#${config.stylix.base16Scheme.base0E}";
          };
          "window" = {
            width = mkLiteral "500px";
            transparency = "real";
            cursor = mkLiteral "default";
            border = mkLiteral "0px";
            border-color = "@border-color";
            background-color = mkLiteral "@bg";
          };
          "mainbox" = {
            padding = mkLiteral "0px";
            enabled = true;
            orientation = mkLiteral "vertical";
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
            background-color = mkLiteral "transparent";
            children = map mkLiteral [
              "prompt"
              "entry"
            ];
          };
          "prompt" = {
              enabled=true;
              background-color= mkLiteral"inherit";
              text-color= mkLiteral"inherit";
          };
          "entry" = {
            enabled = true;
            background-color = mkLiteral "@bg";
            text-color = mkLiteral "@text-color";
            cursor = mkLiteral "text";
            placeholder = " Search...";
            placeholder-color = mkLiteral "inherit";
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
            background-color = mkLiteral "transparent";
            border = mkLiteral "0px";
          };
          "button" = {
            width = mkLiteral "5%";
            padding = mkLiteral "12px";
            background-color = mkLiteral "@text-selected";
            text-color = mkLiteral "@text-color";
            cursor = mkLiteral "pointer";
          };
          "button selected" = {
            background-color = mkLiteral "@selected";
            text-color = mkLiteral "@text-selected";
          };
          "scrollbar" = {
            handle-color = mkLiteral "@border-color";
            handle-width = mkLiteral "5px";
          };
          "element" = {
            enabled = true;
            spacing = mkLiteral "10px";
            padding = mkLiteral "8px";
            background-color = mkLiteral "transparent";
            cursor = mkLiteral "pointer";
          };
          "element normal.normal" = {
            background-color = mkLiteral "inherit";
            text-color = mkLiteral "inherit";
          };
          "element normal.urgent" = {
            background-color = mkLiteral "@urgent";
            text-color = mkLiteral "@foreground";
          };
          "element normal.active" = {
            background-color = mkLiteral "@active";
            text-color = mkLiteral "@foreground";
          };
          "element selected.normal" = {
            background-color = mkLiteral "@selected";
            text-color = mkLiteral "@text-selected";
          };
          "element selected.urgent" = {
            background-color = mkLiteral "@urgent";
            text-color = mkLiteral "@text-selected";
          };
          "element selected.active" = {
            background-color = mkLiteral "@urgent";
            text-color = mkLiteral "@text-selected";
          };
          "element alternate.normal" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
          };
          "element alternate.urgent" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
          };
          "element alternate.active" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
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
          "message" = {
            background-color = mkLiteral "transparent";
            border = mkLiteral "0px";
          };
          "textbox" = {
            background-color = mkLiteral "@bg-alt";
            text-color = mkLiteral "@bg";
            vertical-align = mkLiteral "0.5";
            horizontal-align = mkLiteral "0.0";
          };
          "error-message" = {
            padding = mkLiteral "15px";
            background-color = mkLiteral "@bg-alt";
            text-color = mkLiteral "@bg";
          };
        };
    };
  };
}

