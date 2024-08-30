{ pkgs, ... }:

{
  # Configure your system-wide user settings (groups, etc), add more users as needed.
  users = {
    defaultUserShell = pkgs.zsh;
    users.martin = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = [
        "video"
        "input"
        "networkmanager"
        "wheel"
        "dialout"
        "libvirtd"
        "podman"
        "docker"
      ];
    };
  };
  programs.zsh.enable = true;
}
