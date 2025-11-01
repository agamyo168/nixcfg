{
  lib,
  config,
  ...
}:
with lib;
{
  options.nixosModules.desktop.niri.enable = mkEnableOption "Niri desktop environment";
  config = mkIf config.nixosModules.desktop.niri.enable {
    programs.niri.enable = true;
  };
}
