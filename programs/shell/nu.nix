{config, pkgs, ...}:

{
    programs = {
        nushell = {
            enable = true;
            configFile.text = ''
$env.config = {
    show_banner: false
    }
            '';
            shellAliases = {
                z = "zellij";
                y = "yazi";
                cat = "bat";
                ".." = "cd ..";
            };
        };
    };
}
