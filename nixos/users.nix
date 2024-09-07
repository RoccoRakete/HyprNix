{ pkgs, ... }:

{
  # Configure your system-wide user settings (groups, etc), add more users as needed.
  users = {
    defaultUserShell = pkgs.zsh;
    users.martin = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
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
