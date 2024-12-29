{ config, pkgs, ... }:

{
    # Enable Emacs
    programs.emacs = {
        enable = true;
        package = pkgs.emacs; # Use the default Emacs package
    };

    # Add Doom Emacs dependencies
    home.packages = with pkgs; [
        # General tools
        clang-tools # Includes clang-format
        glslang      # For GLSL code completion
        libxml2      # Includes xmllint for XML formatting
        php
        php84Packages.composer
        gcc
        libtool

        # Shell tools
        shfmt
        shellcheck

        # Web development tools
        html-tidy
        nodePackages.js-beautify
        nodePackages.stylelint

        # Python tools
        python3
        python3Packages.black
        python3Packages.pyflakes
        python3Packages.isort
        pipenv
        python3Packages.pytest
        python313Packages.nose2
        python313Packages.setuptoolsBuildHook
        python313Packages.setuptools

        # Go tools
        gopls
        go-tools  # Includes gomodifytags, gotests, and others
        gomodifytags
        gotests
        gore

    ];
}

