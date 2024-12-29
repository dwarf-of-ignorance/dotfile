{pkgs, ...}:

{
    home.packages = (with pkgs; [
        libreoffice
        zed-editor
        fd
        libsForQt5.okular
        pandoc
        zip
        qalculate-gtk
        wl-gammactl
        vlc
        mcron
        obsidian
        android-studio
        tg
        gimp
        pavucontrol
        tree
        greetd.tuigreet
        discord
        kdePackages.kdeconnect-kde
        yt-dlp
        freetube
        chromium
        qbittorrent
        anki
        mcron
        sweethome3d.application
        font-manager
        ytfzf
        widelands
        gnumake
        cmake
        ytmdesktop
        spotube
        nodejs_23
#       onlyoffice-desktopeditors
#       onlyoffice-documentserver
  ]);
}

