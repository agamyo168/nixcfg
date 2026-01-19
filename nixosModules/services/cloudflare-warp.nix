{
  config,
  lib,
  ...
}:
{
  options.nixosModules.services.cloudflare-warp.enable = lib.mkEnableOption "Cloudflare warp enabled";
  config = lib.mkIf config.nixosModules.services.cloudflare-warp.enable {
    services.cloudflare-warp.enable = true;
  };
}
