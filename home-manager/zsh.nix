{ config, ... }:

{
  programs = {
    starship = {
      enable = true;
    };
    zsh = {
      enable = true;
      enableCompletion = false;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = false;
      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; }
          { name = "marlonrichert/zsh-autocomplete"; }
          { name = "zsh-users/zsh-syntax-highlighting"; }
        ];
      };
      initExtra = ''
        nerdfetch
        export TERM=xterm
        export EDITOR=nvim
      '';
      shellAliases = {
        #ll = "ls -lah";
        ll = "eza -loah --icons=always --no-permissions --git";
        v = "nvim";

        editd = "nvim ~/.dots/nixos";

        pushd = "cd ~/.dots/nixos && git add -A && git commit && git push --repo https://github.com/RoccoRakete/HyprNix.git && cd ~";
        add = "cd ~/.dots/nixos && git add -A && cd ~";

        update = "sudo nixos-rebuild switch";
        flake-update = "nix flake update ~/.dots/nixos";
        fwup = "sudo fwupdmgr refresh --force && sudo fwupdmgr get-updates && sudo fwupdmgr update";

        upgrade-laptop = "nh os switch --hostname zeus /home/martin/.dots/nixos";
        home-upgrade-laptop = "nh home switch /home/martin/.dots/nixos";
        news-laptop = "home-manager news --flake ~/.dots/nixos#zeus";
      };
      historySubstringSearch = {
        enable = true;
      };
      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
