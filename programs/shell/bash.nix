{ config, pkgs, ... }:

{
    programs = {
        bash = {
            shellAliases = {
                TERM="xterm-256color";
                z = "zellij";
                y = "yazi";
                v = "nvim";
                cat = "bat";
                ls = "eza --icons";
                ll = "eza -lh --icons --grid --group-directories-first";
                la = "eza -lah --icons --grid --group-directories-first";
                ".." = "cd ..";
                vi = "nvim $(fzf -m --preview='bat  --color=always {}')";
            };
            enable = true;
            enableCompletion = true;
        };
    };
}

