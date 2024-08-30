{ inputs, pkgs, ... }: {

  home.packages = with pkgs; [
    nixpkgs-fmt
    swww
  ];
}
