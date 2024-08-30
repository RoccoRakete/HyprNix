{ pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "RoccoRakete";
      userEmail = "m.schaumann@mscloud.uk";
      extraConfig = {
        credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
      };
    };
  };
}
