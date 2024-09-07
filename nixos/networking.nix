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

    # Wireguard
    wireguard = {
      enable = false;
      interfaces = {
        wg0 = {
          ips = [
            "10.7.0.2/24"
          ];
          peers = [
            {
              persistentKeepalive = 25;
              presharedKey = "WabV0EZMfvkZsJMb4melov9xrNfA9Y9Fi0ChxlghsDY=";
              allowedIPs = [
                "0.0.0.0/0"
                "::/0"
              ];
              endpoint = "wg.mscloud.uk:51820";
              publicKey = "4bZ/E9q4cSr0b2rQgFm6WSMs1NsMBNZeDKs6sH1s0jw=";
            }
          ];
          privateKey = "CElStDuVy2p1U4f0A8yB6GNBqM7pFWqnfgMAPueBgVM=";
        };
      };
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
