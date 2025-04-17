{ config, lib, pkgs, ... }: {
  options.nixosModules.desktop.gnome.enable =
    lib.mkEnableOption "Gnome desktop environment";
  config = lib.mkIf config.nixosModules.desktop.gnome.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
  };

}
