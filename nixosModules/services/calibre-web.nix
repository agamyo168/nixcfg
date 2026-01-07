{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.nixosModules.services.calibre-web.enable = lib.mkEnableOption "Calibre Web Service";
  config = lib.mkIf config.nixosModules.services.calibre-web.enable {

    environment.systemPackages = with pkgs; [
      calibre-web
    ];
  };
}
