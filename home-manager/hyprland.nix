{ inputs, pkgs, ... }:

{
  wayland.windowManager = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      systemd.variables = [ "--all" ];
    };
  };

  programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.system}.hyprland;
  };

  services.hypridle = {
    enable = true;
    package = inputs.hypridle.packages.${pkgs.system}.hyprland;
  };
}
