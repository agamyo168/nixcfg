{ config, pkgs, ... }:
{
  options.nixosModules.apps.nh.enable = lib.mkEnableOption "Nix cli helper";
  config = lib.mkIf config.nixosModules.apps.nh.enable {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 14d --keep 3";
      flake = "/home/jimbo/.dotfiles";
    };
  };

}
