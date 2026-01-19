{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.firefox.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.firefox.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.wrapFirefox pkgs.firefox-beta-unwrapped {
        extraPolicies = {
          CaptivePortal = false;
          DisableFirefoxStudies = true;
          DisablePocket = true;
          DisableTelemetry = true;
          DisableFirefoxAccounts = false;
          NoDefaultBookmarks = true;
          OfferToSaveLogins = false;
          OfferToSaveLoginsDefault = false;
          PasswordManagerEnabled = false;
          HardwareAcceleration = true;
          FirefoxHome = {
            Search = true;
            Pocket = false;
            Snippets = false;
            TopSites = false;
            Highlights = false;
          };
          UserMessaging = {
            ExtensionRecommendations = false;
            SkipOnboarding = true;
          };
        };
      };

      profiles = {

        default = {
          id = 0;
          name = "perry";
          isDefault = true;

          extensions = {
            packages = with inputs.firefox-addons.packages.${pkgs.system}; [
              ublock-origin
              bitwarden
              duckduckgo-privacy-essentials
              sponsorblock
              adaptive-tab-bar-colour
            ];
          };
        };
        work = {
          id = 1;
          name = "work";

          extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
            ublock-origin
            bitwarden
            duckduckgo-privacy-essentials
            sponsorblock
            i-dont-care-about-cookies
            adaptive-tab-bar-colour
          ];

        };

      };

    };
  };

}
