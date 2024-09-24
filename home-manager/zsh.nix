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
      localVariables = {
        DOTL = [ "~/.dots/nixos" ];
        DORTL = [ "https://github.com/RoccoRakete/HyprNix.git" ];
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

        cdd = "cd ~/.dots/nixos";
        editd = "nvim ~/.dots/nixos";

        add = "cdd && git add -A && cd -";
        commitd = "cdd && git add -A && if ! git diff-index --quiet HEAD; then git commit ; fi && cd -";
        pushd = "cdd && add && commitd && git push --repo https://github.com/RoccoRakete/HyprNix.git && cd -";

        update = "sudo nixos-rebuild switch";
        fwup = "sudo fwupdmgr refresh --force && sudo fwupdmgr get-updates && sudo fwupdmgr update";

        flake-update = "commitd && nix flake update ~/.dots/nixos && commitd";
        upgrade-laptop = "commitd && nh os switch --hostname zeus /home/martin/.dots/nixos";
        home-upgrade-laptop = "commitd & nh home switch /home/martin/.dots/nixos";
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
