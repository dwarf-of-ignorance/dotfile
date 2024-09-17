{ pkgs,config, ...}:
{
    programs.yazi = {
        enable = true;
        settings = {
            preview = {
                image_filter = "lanczos3";
                ueberzug_scale = 3;
                ueberzug_offset = [0 0 0 0];
            };
        };
    };
}
