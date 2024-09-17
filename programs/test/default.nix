{pkgs, ...}:

{
    home.packages = (with pkgs; [
        iproute2
        wirelesstools
        iw  
    ]);
}

