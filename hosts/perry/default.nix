{ lib, pkgs, ... }: {
  imports =
    [ ./configuration.nix ./hardware-configuration.nix ../../nixosModules ];
  programs.fish.enable = true;
  nixosModules = {
    desktop = {
      kde.enable = true;
      # gnome.enable = true;
    };
  };
}
