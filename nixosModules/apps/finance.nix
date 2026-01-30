{
  config,
  lib,
  ...
}:
{
  options.nixosModules.apps.finance.enable = lib.mkEnableOption "Actual + Other finance apps";
  config = lib.mkIf config.nixosModules.apps.finance.enable {
    services.actual =  {
      enable = true;
      openFirewall = true;
    };
  };

}
