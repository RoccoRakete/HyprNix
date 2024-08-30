{ ... }:

{
  # XDG DesktopEntries
  xdg.desktopEntries."org.gnome.Settings" = {
    name = "Settings";
    comment = "Gnome Control Center";
    icon = "org.gnome.Settings";
    exec = "env XDG_CURRENT_DESKTOP=GNOME gnome-control-center --verbose";
    categories = [ "X-Preferences" ];
    terminal = true;
  };
}
