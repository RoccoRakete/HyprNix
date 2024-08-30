{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #Flake inputs
    inputs.eza.packages.${system}.default
    inputs.nh.packages.${system}.default

    #Gnome
    gnome.gvfs
    gnome.gnome-control-center
    nautilus
    eog
    gnome-calendar
    gnome-calculator
    gnome-disk-utility

    #Game
    lutris

    #Office
    thunderbird
    libreoffice-fresh
    nextcloud-client
    mailspring
    localsend
    gimp

    #FPV
    betaflight-configurator

    #HomeLab
    rpi-imager
    super-slicer-beta

    #Media
    spotify
    gthumb
    playerctl

    #System
    nerdfetch
    swaynotificationcenter
    mission-center
    seahorse
    avizo
    imagemagick
    nwg-look
    clipse
    wf-recorder
    grimblast
    pika-backup
    polkit
    wget
    brightnessctl
    libnotify
    inotify-tools
    pavucontrol
    bluez
    bluez-tools
    wl-clip-persist
    wl-clipboard
    xdg-desktop-portal
    distrobox
    nixos-icons
    libsecret
    wireguard-tools
    wireguard-go
    networkmanagerapplet
    intel-gpu-tools
    usbutils
    btop
    wayshot
    unzip
    wev
    sabnzbd
    wlr-randr
    powertop
    poweralertd

    #Styling
    hyprpicker
    gradience

    #Code
    stylua
    codespell
    black
    prettierd
    shfmt
    lua-language-server
    dart-sass
    sassc
    neovide
    fzf
    python3
    cargo
    ripgrep
    fd
    jq
    nil
    rustfmt
    jsonfmt
    luaformatter
    pkg-config
    uncrustify
    nixpkgs-fmt
    nixfmt-rfc-style
  ];
}
