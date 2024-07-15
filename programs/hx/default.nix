
{ pkgs,config, ...}:{
home.file.".config/helix/themes/gruvbox.toml".source = ./gruvbox.toml;
  programs.helix= {
    enable = true;
    extraPackages = [
      pkgs.gopls
        pkgs.pyright
        pkgs.jdt-language-server
        pkgs.lua-language-server
        pkgs.nil
        pkgs.javascript-typescript-langserver
        pkgs.llvmPackages_18.clang-tools
    ];
    settings = {
    theme = "gruvbox";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        lsp.display-messages = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides.render = true;
      };
    };
  };
}
