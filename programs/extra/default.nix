{pkgs, ...}:

{
    home.packages = (with pkgs; [
        libreoffice
        zed-editor
        fd
        libsForQt5.okular
        vivaldi
        pandoc
        zip
        qalculate-gtk
        wl-gammactl
        vlc
        signal-desktop
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
  ]);
}

