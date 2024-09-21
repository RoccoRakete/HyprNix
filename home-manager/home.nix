{ ... }:
{
  imports = [
    #./brave.nix
    ./dotfile-overwrites.nix
    ./envHome.nix
    ./firefox.nix
    ./git.nix
    ./gnome.nix
    #./hyprland.nix
    ./kitty.nix
    ./pkgs.nix
    ./styling.nix
    ./vscode.nix
    ./waybar.nix
    ./wlogout.nix
    ./wofi.nix
    ./zsh.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  # Set your username
  home = {
    username = "martin";
    homeDirectory = "/home/martin";
  };

  # Enable programs
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
