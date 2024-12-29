{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "monolisa";
  version = "1.30";
  src = ./.;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    if [ -d "./fonts" ]; then
      cp -r ./fonts/*.ttf $out/share/fonts/truetype/
    else
      echo "No fonts found in $./fonts"
      exit 0
    fi
  '';

  meta = with pkgs.lib; {
    description = "Monolisa Nerd Fonts";
    homepage = "https://www.monolisa.dev/";
    platforms = platforms.all;
  };
}

