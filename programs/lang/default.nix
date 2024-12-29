{pkgs, ...}:
{
  home.packages = (with pkgs; [
#languages
        zulu
        zig
        python3
        go


  ]);
}
