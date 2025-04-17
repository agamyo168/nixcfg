{ config, lib, pkgs, ... }:
{
  options.nixosModules.desktop.kde.enable = lib.mkEnableOption "KDE desktop environment";
  config = lib.mkIf config.nixosModules.desktop.kde.enable {
    # What is that?
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
