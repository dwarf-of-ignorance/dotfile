{pkgs, ...}:

{
  home.packages = (with pkgs; [
        viber
        libreoffice
        zed-editor
        fd
        libsForQt5.okular
        vivaldi
  ]);
}

