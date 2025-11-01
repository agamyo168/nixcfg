{
  config,
  lib,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.nixosModules.desktop.kde.enable = mkEnableOption "KDE desktop environment";
  config = mkIf config.nixosModules.desktop.kde.enable {
    # What is that?
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
