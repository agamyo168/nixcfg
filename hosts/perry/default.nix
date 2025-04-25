{ lib, pkgs, ... }:
{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../nixosModules
  ];
  # nix.channel.enable = false; # Disable nix channel

  nixosModules = {
    desktop.kde.enable = true;
    apps.nh.enable = true; # I should make a core module and put all cool modules in it.
  };
}
