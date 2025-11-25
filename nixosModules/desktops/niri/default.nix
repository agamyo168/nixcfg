{
  lib,
  config,
  ...
}:
with lib;
{
  options.nixosModules.desktop.niri.enable = mkEnableOption "Niri desktop environment";
  config = mkIf config.nixosModules.desktop.niri.enable {
    environment.etc."xdg/autostart/org.kde.xwaylandvideobridge.desktop".text = ''
      ...
      OnlyShowIn=KDE #This is what we need to add to the copy
      ...
    '';
    programs.niri.enable = true;
  };
}
