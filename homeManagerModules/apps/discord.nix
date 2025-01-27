{ pkgs, lib, config, ... }:
{
  options.modules.discord.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.discord.enable {
    home.packages = with pkgs; [
      discord
    ];
  };

}
