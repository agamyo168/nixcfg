{
  imports = [
      ../../nixosModules/apps/tv.nix
      ../../nixosModules/apps/nh.nix
      ../../nixosModules/services/syncthing.nix
      ./configuration.nix
  ];
  nixosModules = {
    apps.nh.enable = true; # I should make a core module and put all cool modules in it.
    apps.tv.enable = true;
   };
}
