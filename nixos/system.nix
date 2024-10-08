{ pkgs, ... }:

{
  # Bootloader.
  boot = {
    initrd.systemd.enable = true;
    plymouth.enable = true;
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages; # LTS
    # kernelPackages = pkgs.linuxPackages_latest; # Mainline
    kernelParams = [
      "quiet"
      "nosgx"
    ];
    loader = {
      timeout = 0;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "always";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  security.polkit.enable = true;

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
    ollama.enable = false;
    stirling-pdf.enable = true;
    power-profiles-daemon.enable = true;
    logind = {
      lidSwitchDocked = "ignore";
      lidSwitch = "ignore";
    };
    upower = {
      ignoreLid = true;
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

  # Enable the GNOME Desktop Environment.
  services.xserver = {
    displayManager.gdm = {
      enable = true;
      settings = {
        daemon = {
          AutomaticLoginEnable = true;
          AutomaticLogin = "martin";
        };
      };
    };
    desktopManager.gnome.enable = true;
  };

  # Enable Cosmic
  # services.desktopManager.cosmic.enable = true;

  # Enable Plasma 6
  #services.desktopManager.plasma6.enable = true;
  #services.displayManager.sddm = {
  #  enable = true;
  #};

  programs = {
    gnome-disks.enable = true;
  };
}
