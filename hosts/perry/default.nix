{ lib, pkgs, ... }:
{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ../../nixosModules
  ];
  
  nixosModules ={ desktop.kde.enable = true; };
}
