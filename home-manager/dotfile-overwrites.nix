{ config, ... }:

{
  # hyprland
  home.file."${config.xdg.configHome}/hypr" = {
    source = ../cfg/hypr;
    recursive = true;
    enable = true;
  };
  # waybar
  home.file."${config.xdg.configHome}/waybar" = {
    source = ../cfg/waybar;
    recursive = true;
    enable = true;
  };
  # wofi
  home.file."${config.xdg.configHome}/wofi" = {
    source = ../cfg/wofi;
    recursive = true;
    enable = true;
  };
  # swaync 
  home.file."${config.xdg.configHome}/swaync" = {
    source = ../cfg/swaync;
    recursive = true;
    enable = true;
  };
  # avizo 
  home.file."${config.xdg.configHome}/avizo" = {
    source = ../cfg/avizo;
    recursive = true;
    enable = true;
  };
  # Avatar 
  home.file."${config.home.homeDirectory}/.face.png" = {
    source = ../cfg/env/.face;
    recursive = true;
    enable = true;
  };
  # wlogout 
  #home.file."${config.xdg.configHome}/wlogout" = {
  #  source = ../cfg/wlogout;
  #  recursive = true;
  #  enable = true;
  #};
}
