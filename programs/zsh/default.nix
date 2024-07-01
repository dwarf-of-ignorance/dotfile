{ config, pkgs, ... }:

{
    programs = {
        zsh = {
            prezto = {
                enable = true;
            };
            sessionVariables= {
                FZF_CTRL_T_OPTS=["
                    --walker-skip .git,node_modules,target
                    --preview 'bat -n --color=always {}'
                    --bind 'ctrl-/:change-preview-window(down|hidden|)'"
                ];
            };
            shellAliases = {
                z = "zellij";
                y = "yazi";
                v = "nvim";
                cat = "bat";
                ls = "eza --icons";
                ll = "eza -lh --icons --grid --group-directories-first";
                la = "eza -lah --icons --grid --group-directories-first";
                ".." = "cd ..";
            };
            enable = true;
            enableCompletion = true;
            autosuggestion.enable = true;
        };
    };
}
