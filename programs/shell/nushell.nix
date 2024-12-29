{ config, pkgs, ... }:
{
    programs.nushell = {
        enable = true;
        extraConfig = #nu
            ''
            $env.config = {
                show_banner: false,
                cursor_shape: {
                    vi_insert: line
                    vi_normal : block
                }

                completions: {
                    case_sensitive: false 
                    quick: true
                    partial: true
                    algorithm: "fuzzy"
                }
            } 
            '';
        shellAliases = {
            sv = "sudo nvim";
            fr = "nh os switch /home/ideal/dotfile";
            fu = " nix flake update --flake /home/ideal/dotfile";
            ncg = "nix-collect-garbage --delete-old and sudo nix-collect-garbage -d and sudo /run/current-system/bin/switch-to-configuration boot";
            v = "nvim";
            cat = "bat";
            ".." = "cd ..";
            vi = "nvim (fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')";
            fzf = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'";
            z = "zellij";
            y = "yazi";
        };
    };  
}
