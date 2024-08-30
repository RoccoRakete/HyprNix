{ inputs, pkgs, ... }:
{

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };

  programs.hyprlock = {
    enable = true;
  };

  services.hypridle = {
    enable = true;
    package = inputs.hypridle.packages.${pkgs.system}.hypridle;
  };

}
