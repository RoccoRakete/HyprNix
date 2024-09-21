{ pkgs, ... }:

{
  dconf.settings = {
    # Gnome Settings
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = true;
    };
    "org/gnome/desktop/notifications" = {
      show-in-lock-screen = true;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      disable-while-typing = true;
      tap-to-click = false;
      edge-scrolling-enabled = false;
      two-finger-scrolling-enabled = true;
      natural-scroll = true;
    };
    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

    # Extensions
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
        caffeine.extensionUuid
        clipboard-indicator.extensionUuid
        coverflow-alt-tab.extensionUuid
        customize-clock-on-lock-screen.extensionUuid
        dash2dock-lite.extensionUuid
        gnome-40-ui-improvements.extensionUuid
        just-perfection.extensionUuid
        power-profile-switcher.extensionUuid
        tiling-assistant.extensionUuid
        workspace-switcher-manager.extensionUuid
        zen.extensionUuid
      ];
    };

    # Extension Settings

    # blur-my-shell
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = false;
    };
    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      blur = true;
    };
    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      blur = true;
    };
    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = false;
    };
    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = false;
    };
    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      blur = true;
    };
    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      blur = true;
    };

    # clipboard-indicator
    "org/gnome/shell/extensions/clipboard-indicator" = {
      preview-size = "30";
    };

    # customize-clock-on-lock-screen
    "org/gnome/shell/extensions/customize-clock-on-lockscreen" = {
      custom-time-text = "%H:%M";
      custom-date-text = "%d. %B";
      remove-hint = true;
    };

    # dash2dock-lite
    "org/gnome/shell/extensions/dash2dock-lite" = {
      animate-icons-unmute = true;
      open-app-animation = true;
      autohide-dash = true;
      autohide-dodge = true;
      pressure-sense = true;
      icon-spacing = "0.14636752136752137";
      running-indicator-style = 1;
      notification-badge-style = 1;
      favorites-only = false;
      apps-icon = false;
      apps-icon-front = false;
      trash-icon = true;
      mounted-icon = true;
      downloads-icon = true;
      max-recent-items = 1;
      autohide-speed = "0.45";
      scroll-sensitivity = "0.4";
    };

    # gnome-ui-tune
    "org/gnome/shell/extensions/gnome-ui-tune" = {
      hide-search = false;
    };

    # power-profile-switcher
    "org/gnome/shell/extensions/power-profile-switcher" = {
      ac = "'balanced";
      bat = "'balanced";
      threshold = "20";
    };
  };
}
