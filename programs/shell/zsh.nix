{ config, pkgs, ... }:

{
    programs = {
        zsh = {
            shellAliases = {
                z = "zellij";
                y = "yazi";
                v = "nvim";
                cat = "bat";
                ls = "eza --icons";
                ll = "eza -lh --icons --grid --group-directories-first";
                la = "eza -lah --icons --grid --group-directories-first";
                ".." = "cd ..";
                vi = "nvim $(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')";
                fzf = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'";
            };
            enable = true;
            enableCompletion = true;
            autosuggestion.enable = true;
        };
    };
}
