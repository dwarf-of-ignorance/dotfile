{pkgs, ...}:

{
  home.packages = (with pkgs; [
        floorp
        viber
        libreoffice
        zed-editor
        fd
        libsForQt5.okular
  ]);
}

