
{ pkgs,config, ...}:
{

    programs.atuin= {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        settings = {
            show_tabs= false;
            inline_height = 0;
            style = "compact";
        };
    };
}
