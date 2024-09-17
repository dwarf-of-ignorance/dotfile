{pkgs, ...}:
{
  home.packages = (with pkgs; [
#languages
          kotlin
          go
          jupyter
  ]);
}
