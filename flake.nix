{
  description = "FlakesFile";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixVim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Waybar
    waybar = {
      url = "github:alexays/waybar";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland... and all its stuff
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };
    hyprlock = {
      url = "github:hyprwm/Hyprlock";
    };
    hypridle = {
      url = "github:hyprwm/Hypridle";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    eza = {
      url = "github:eza-community/eza";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        zeus = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          # > Our main nixos configuration file <
          modules = [
            ./nixos/configuration.nix
            inputs.nixvim.nixosModules.nixvim
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "martin@zeus" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          # > Our main home-manager configuration file <
          modules = [ ./home-manager/home.nix ];
        };
      };
    };
}
