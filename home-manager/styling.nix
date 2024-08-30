{ pkgs, ... }:

{
  imports = [
  ];

  home = {

    # Cursor
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };

  gtk = {
    enable = true;

    # GTK-Icons
    # Yaru
    #iconTheme.package = pkgs.yaru-theme;
    #iconTheme.name = "Yaru";

    # MoreWaita
    iconTheme.package = pkgs.morewaita-icon-theme;
    iconTheme.name = "MoreWaita";

    # GTK-Colors
    # Catppuccin
    #theme.name = "Catppuccin-Mocha-Standard-Blue-Dark";
    #theme.package = pkgs.catppuccin-gtk.override {
    #  accents = [ "
    #theme.package = pkgs.kanagawa-gtk-theme.override { };

    # Catppuccin
    theme.name = "adw-gtk3-dark";
    theme.package = pkgs.adw-gtk3;

    # Fonts
    font = {
      name = "LiterationSans Nerd Font";
      size = 13;
    };
  };

  # QT
  #qt = {
  #  enable = true;
  #  platformTheme = "gtk";
  #  style.name = "Catppuccin-Mocha-Standard-Blue-Dark";
  #};
}
