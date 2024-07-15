{pkgs, ...}:
{
  home.packages = (with pkgs; [
#languages
#     python3
#     #----------packages----------------#
#     python312Packages.numpy
#     python312Packages.pandas
#     python312Packages.matplotlib
#     python312Packages.seaborn
#     python312Packages.bokeh
#     python312Packages.plotly
#     python312Packages.folium
#     python312Packages.pip
      #------------------------------------#
      kotlin
#     rustc
#     cargo
  ]);
}
