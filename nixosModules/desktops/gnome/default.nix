{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.nixosModules.desktop.gnome.enable = lib.mkEnableOption "Gnome desktop environment";
  config = lib.mkIf config.nixosModules.desktop.gnome.enable {
    environment.systemPackages = with pkgs; [
      gnome-tweaks
      dconf-editor
      # gnomeExtensions.easyeffects-preset-selector
      # #https://github.com/SUPERCILEX/gnome-clipboard-history
      gnomeExtensions.clipboard-history # Alt + F2 then r to restart gnome shell then write this to terminal gnome-extensions enable clipboard-history@alexsaveau.dev
      # gnomeExtensions.paperwkm
    ];
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
  };

}
