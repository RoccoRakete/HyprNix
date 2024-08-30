{ lib, ... }:

{
  networking = {
    networkmanager.enable = true;
    hostName = "zeus";
    useDHCP = lib.mkDefault true;
    firewall = {
      enable = true;
      #allowedTCPPorts = [ 53317 ];
      #allowedUDPPorts = [ 53317 ];
    };
  };

  # SSH
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
}
