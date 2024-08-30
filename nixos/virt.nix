{
  pkgs,
  ...
}:

{
  # virtualisation
  virtualisation = {
    docker.rootless = {
      enable = true;
      setSocketVariable = true;
      daemon.settings = {
        data-root = "/home/martin/docker";
      };
    };
  };
  boot.enableContainers = false;
  programs.virt-manager = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    podman-tui
    podman-compose
  ];
}
