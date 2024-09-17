{
    programs.starship = {
        enable = true;
        settings = {
        add_newline=true;
            nix_shell = {
                format = " (#458588)";
                disabled = false;
            };
            character = {
                success_symbol = "❯(#8ec07c)";
                error_symbol = "❯(#cc241d)";
            };
        };
    };
}
