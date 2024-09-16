{ ... }:
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
      }

      {
        label = "hibernate";
        action = "systemctl hibernate";
      }

      {
        label = "logout";
        action = "loginctl kill-user $(whoami)";
      }

      {
        label = "shutdown";
        action = "shutdown now";
      }

      {
        label = "suspend";
        action = "loginctl suspend";
      }

      {
        label = "reboot";
        action = "reboot";
      }
    ];
    style = ''
* {
  background-image: none;
}

window {
  background-color: rgba(0, 0, 0, 0.8);
}

button {
  color: #ffffff;
  background-color: #11111b;
  border-style: solid;
  border-color: #89b4fa;
  border-width: 2px;
  border-radius: 50px;
  background-repeat: no-repeat;
  background-position: center;
  background-size: 25%;
  margin: 30px;
}

button:focus,
button:active {
  background-color: #313244;
  outline-style: none;
  color: #000000;
}

button:hover {
  background-color: #45475a;
  color: #000000;
}

#lock {
  background-image: image(url("/home/martin/.dots/nixos/cfg/wlogout/icons/lock.png"));
}

#logout {
  background-image: image(url("/home/martin/.dots/nixos/cfg/wlogout/icons/logout.png"));
}

#suspend {
  background-image: image(url("/home/martin/.dots/nixos/cfg/wlogout/icons/suspend.png"));
}

#hibernate {
  background-image: image(url("/home/martin/.dots/nixos/cfg/wlogout/icons/hibernate.png"));
}

#shutdown {
  background-image: image(url("/home/martin/.dots/nixos/cfg/wlogout/icons/shutdown.png"));
}

#reboot {
  background-image: image(url("/home/martin/.dots/nixos/cfg/wlogout/icons/reboot.png"));
}
    '';
  };
}
