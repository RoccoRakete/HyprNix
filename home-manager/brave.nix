{ pkgs, ... }: {
  programs.brave = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
    ];
    commandLineArgs = [
      "--enable-features=TouchpadOverscrollHistoryNavigation"
      "--password-store=basic"
    ];
  };
}
