{
  pkgs,
  username,
  ...
}:

let
  inherit (import ./variables.nix) gitUsername;
in
    {
    imports = [
    ];
    
  services.httpd = {
    enable = true;
    adminAddr = "webmaster@example.org";
    enablePHP = true;
    virtualHosts = {
      "localhost" = {
        documentRoot = "/var/www/localhost";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    php
  ];
    users.users = {
    "${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${gitUsername}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
      ];
            shell = pkgs.zsh;
            ignoreShellProgramCheck = true;
        };
    # "newuser" = {
    #   homeMode = "755";
    #   isNormalUser = true;
    #   description = "New user account";
    #   extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    #   shell = pkgs.bash;
    #   ignoreShellProgramCheck = true;
    #   packages = with pkgs; [];
    # };
  };
}
