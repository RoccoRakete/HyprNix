{ pkgs, ... }:

{
  # Bootloader.
  boot = {
    initrd.systemd.enable = true;
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "nosgx"
    ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware = {
    graphics.extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
      vaapiIntel
    ];
  };

  services = {
    blueman.enable = true;
    fwupd.enable = true;
    gvfs.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    logind = {
      lidSwitchDocked = "ignore";
      #lidSwitch = "ignore";
    };
    udev.extraRules = ''
      # DFU (Internal bootloader for STM32 and AT32 MCUs)
      ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE="0664", GROUP="plugdev"
      ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="df11", MODE="0664", GROUP="plugdev"
    '';
    gnome = {
      tracker.enable = true;
      tracker-miners.enable = true;
      sushi.enable = true;
      gnome-keyring.enable = true;
    };
  };
  programs = {
    gnome-disks.enable = true;
  };
}
