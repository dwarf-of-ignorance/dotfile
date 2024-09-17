
{ pkgs,config, ...}:
{

    programs.foot= {
        settings = {
            main = {
#               font = "Fira Code:size=14";
            };
            cursor.style = "beam";
            mouse = {
                hide-when-typing = "yes";
            };
        };
        enable = true;
    };
}
