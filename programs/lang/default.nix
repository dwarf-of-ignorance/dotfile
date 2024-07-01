{pkgs, ...}:

{
  home.packages = (with pkgs; [
#languages
      zulu
      go
      python3
      #----------packages----------------#
      python312Packages.numpy
      python312Packages.pandas
      python312Packages.matplotlib
      python312Packages.seaborn
      python312Packages.bokeh
      python312Packages.plotly
      python312Packages.folium
      #------------------------------------#
      R
      zig
      rocmPackages.llvm.clang-unwrapped
      rstudio-server
      nodejs_22
      rustc
      cargo
  ]);
}
