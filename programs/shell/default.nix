{pkgs, ...}:{
    imports = [
        ./zsh.nix
            ./nu.nix
            ./starship.nix
            ./bash.nix
    ];
#   home.packages = with pkgs; [
#     (writeShellScriptBin "zs" (builtins.readFile ./scripts/zs))
#   ];
}
