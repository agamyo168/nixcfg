{ pkgs,config,lib, ... }:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.games.minecraft.enable = mkEnableOption "Minecraft";
  config = mkIf config.modules.games.minecraft.enable {
  home.packages = with pkgs; [
    prismlauncher
  ];
  };
}
