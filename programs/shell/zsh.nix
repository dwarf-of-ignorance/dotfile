{ config, pkgs, ... }:
{
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      profileExtra = ''
        #if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        #  exec Hyprland
        #fi
      '';
      initExtra = ''
        fastfetch
        if [ -f $HOME/.bashrc-personal ]; then
          source $HOME/.bashrc-personal
        fi
      '';
        shellAliases = {
            sv = "sudo nvim";
            fr = "nh os switch /home/ideal/dotfile";
            fu = " nix flake update --flake /home/ideal/dotfile";
            ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
            v = "nvim";
            cat = "bat";
            ls = "eza --icons";
            ll = "eza -lh --icons --grid --group-directories-first";
            la = "eza -lah --icons --grid --group-directories-first";
            ".." = "cd ..";
            vi = "nvim $(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')";
            fzf = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'";
            z = "zellij";
            y = "yazi";
      };
    };
}
