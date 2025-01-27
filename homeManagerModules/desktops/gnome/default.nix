{ config, lib, pkgs, ... }:
{
  options.modules.gnome-extensions.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.gnome-extensions.enable {
    home.packages = with pkgs; [
      gnome-tweaks
      dconf-editor
      # #https://github.com/SUPERCILEX/gnome-clipboard-history
      gnomeExtensions.clipboard-history # Alt + F2 then r to restart gnome shell then write this to terminal gnome-extensions enable clipboard-history@alexsaveau.dev
      gnomeExtensions.paperwm
    ];
  };

  # I don't know how to tweak this yet
  # dconf = {
  #   enable = true;
  #   settings."org/gnome/shell" = {
  #     disable-user-extensions = false;
  #     enabled-extensions = with pkgs.gnomeExtensions; [
  #       clipboard-history.extensionUuid
  #       paperwm.extensionUuid
  #     ];
  #   };
  # };

}
