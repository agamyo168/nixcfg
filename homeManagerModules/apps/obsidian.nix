{ config, lib, pkgs, ... }:
{
  options.modules.obsidian.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.obsidian.enable {
    home.packages = with pkgs; [
      #Apps
      obsidian
    ];
  };
}
