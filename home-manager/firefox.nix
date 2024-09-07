{ ... }:
{
  programs = {
    firefox = {
      enable = true;
      languagePacks = [
        "en-GB"
        "de"
      ];
      policies = {
        Preferences = {
          general.smoothScroll = {
            Value = false;
          };
        };
        BlockAboutConfig = false;
        DefaultDownloadDirectory = "\${home}/Downloads";
        AppAutoUpdate = false;
        DisableFirefoxAccounts = true;
        DisablePocket = true;
        DisableProfileImport = true;
        DisableTelemetry = true;
        DisplayBookmarksToolbar = "newtab";
        Extensions = {
          Install = [
            "https://addons.mozilla.org/firefox/downloads/file/4328681/ublock_origin-1.59.0.xpi"
            "https://addons.mozilla.org/firefox/downloads/file/4340992/bitwarden_password_manager-2024.8.0.xpi"
            "https://addons.mozilla.org/firefox/downloads/file/4216095/istilldontcareaboutcookies-1.1.4.xpi"
            "https://addons.mozilla.org/firefox/downloads/file/4325319/enhancer_for_youtube-2.0.126.xpi"
            "https://addons.mozilla.org/firefox/downloads/file/4308094/sponsorblock-5.7.xpi"
          ];
        };
        ExtensionUpdate = true;
        FirefoxHome = {
          Search = true;
          TopSites = false;
          SponsoredTopSites = false;
          Highlights = false;
          Pocket = false;
          SponsoredPocket = false;
          Snippets = false;
          Locked = true;
        };
        HardwareAcceleration = true;
        Homepage = {
          URL = "google.com";
          StartPage = "homepage";
        };
        OfferToSaveLogins = false;
        PasswordManagerEnabled = false;
        PictureInPicture = {
          Enabled = false;
        };
      };
    };
  };
}
