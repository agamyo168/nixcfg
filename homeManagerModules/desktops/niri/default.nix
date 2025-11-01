{
  lib,
  pkgs,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.niri.enable = mkEnableOption "";
  config = mkIf config.modules.niri.enable {
    xdg.configFile."niri/config.kdl".source = ./config.kdl;
    programs.alacritty.enable = true; # Super+T in the default setting (terminal)
    programs.fuzzel.enable = true; # Super+D in the default setting (app launcher)
    programs.swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
    programs.waybar.enable = true; # launch on startup in the default setting (bar)
    # services.swayidle.enable = true; # idle management daemon
    services.swaync.enable = true; # notification daemon
    #services.mako.enable = true; # notification daemon
    services.polkit-gnome.enable = true; # polkit
    xdg.portal = {
      enable = true;
      extraPortals = [
        # pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
      ];

      # New in xdg-desktop-portal 1.17
      config = {
        common = {
          default = [
            "wlr"
            #  "gtk"
          ];
        };
      };
    };
    home.packages = with pkgs; [
      swaybg # wallpaper
      #      xwayland-satellite # hope this fixes the xdg portal stuff
      playerctl # mpris
    ];
  };
}
