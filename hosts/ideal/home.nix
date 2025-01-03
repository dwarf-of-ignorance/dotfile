{
  pkgs,
  username,
  host,
  ...
}:
let
  inherit (import ./variables.nix) gitUsername gitEmail;
in
{
  # Home Manager Settings
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11";

  # Import Program Configurations
  imports = [
    ../../config/hyprland.nix
    ../../config/swaync.nix
    ../../config/waybar.nix
    ../../config/wlogout.nix
    ../../programs

  ];

  # Place Files Inside Home Directory
  home.file."Pictures/Wallpapers" = {
    source = ../../config/wallpapers;
    recursive = true;
  };
  home.file.".config/wlogout/icons" = {
    source = ../../config/wlogout;
    recursive = true;
  };
  home.file.".config/swappy/config".text = ''
    [Default]
    save_dir=/home/${username}/Pictures/Screenshots
    save_filename_format=swappy-%Y%m%d-%H%M%S.png
    show_panel=false
    line_size=5
    text_size=20
    text_font=Ubuntu
    paint_mode=brush
    early_exit=true
    fill_shape=false
  '';

  # Install & Configure Git
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
  };

  # Create XDG Dirs
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  # Styling Options
  stylix.targets.waybar.enable = false;
  stylix.targets.rofi.enable = false;
  stylix.targets.wofi.enable = false;
  stylix.targets.zellij.enable = false;
  stylix.targets.hyprland.enable = false;
  stylix.targets.kitty.enable = false;
  stylix.targets.wezterm.enable = false;
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    enable = true;
    style.name = "adwaita-dark";
    platformTheme.name = "gtk3";
  };


  # Scripts
  home.packages = [
    (import ../../scripts/task-waybar.nix { inherit pkgs; })
    (import ../../scripts/zellij-sessionizer.nix{ inherit pkgs; })
    (import ../../scripts/nvidia-offload.nix { inherit pkgs; })
    (import ../../scripts/wallsetter.nix {
      inherit pkgs;
      inherit username;
    })
    (import ../../scripts/rofi-launcher.nix { inherit pkgs; })
    (import ../../scripts/screenshootin.nix { inherit pkgs; })
    (import ../../scripts/list-hypr-bindings.nix {
      inherit pkgs;
      inherit host;
    })
  ];

    services = {
        hypridle = {
            settings = {
                general = {
                    after_sleep_cmd = "hyprctl dispatch dpms on";
                    ignore_dbus_inhibit = false;
                    lock_cmd = "hyprlock";
                };
                listener = [
                    {
                        timeout = 900;
                        on-timeout = "hyprlock";
                    }
                    {
                        timeout = 1200;
                        on-timeout = "hyprctl dispatch dpms off";
                        on-resume = "hyprctl dispatch dpms on";
                    }
                ];
            };
        };
    };

    programs = {
        gh.enable = true;
        starship = {
            enable = true;
            package = pkgs.starship;
            enableNushellIntegration = true;
            settings = {
                scan_timeout = 2;
                command_timeout = 2000; # nixpkgs makes starship implode with lower values
                add_newline = false;
                line_break.disabled = false;
                # configure specific elements
                character = {
                    error_symbol = "[](bold red)";
                    success_symbol = "[](bold green)";
                    format = "$symbol [|](bold bright-black) ";
                };

                directory = {
                    truncation_length = 2;
                };

                # git
                git_commit.commit_hash_length = 7;
                git_branch.style = "bold purple";
                git_status = {
                    style = "red";
                    ahead = "⇡ ";
                    behind = "⇣ ";
                    conflicted = " ";
                    renamed = "»";
                    deleted = "✘ ";
                    diverged = "⇆ ";
                    modified = "!";
                    stashed = "≡";
                    staged = "+";
                    untracked = "?";
                };

                lua.symbol = " ";
                python.symbol = " ";
                rust.symbol = " ";
                nix_shell.symbol = "󱄅 ";
                c.symbol = " ";
                nodejs.symbol = "󰎙 ";
                aws.symbol = "  ";
                buf.symbol = " ";
                conda.symbol = " ";
                crystal.symbol = " ";
                dart.symbol = " ";
                directory.read_only = "󰌾";
                docker_context.symbol = " ";
                elixir.symbol = " ";
                elm.symbol = " ";
                fennel.symbol = " ";
                golang.symbol = " ";
                guix_shell.symbol = " ";
                haskell.symbol = " ";
                haxe.symbol = " ";
                hostname.ssh_symbol = " ";
                java.symbol = " ";
                julia.symbol = " ";
                kotlin.symbol = " ";
                memory_usage.symbol = "󰍛 ";
                meson.symbol = "󰔷 ";
                nim.symbol = "󰆥 ";
                ocaml.symbol = " ";
                package.symbol = "󰏗 ";
                perl.symbol = " ";
                php.symbol = " ";
                rlang.symbol = "󰟔 ";
                ruby.symbol = " ";
                scala.symbol = " ";
                swift.symbol = " ";
                zig.symbol = " ";
                gradle.symbol = " ";
            };
        };
    home-manager.enable = true;
    hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 10;
          hide_cursor = true;
          no_fade_in = false;
        };
      };
    };
  };
}
