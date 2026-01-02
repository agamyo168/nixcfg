{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../nixosModules
  ];
  # Disable nix channel
  # nix = {
  #   channel.enable = false;
  #   registry = (lib.mapAttrs (_: flake: { inherit flake; }) inputs);
  #   nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") inputs;
  #   settings = {
  #     nix-path = lib.mapAttrsToList (n: _: "${n}=flake:${n}") inputs;
  #     flake-registry = "";
  #   };
  # };

  nixosModules = {
    desktop.gnome.enable = false;
    desktop.kde.enable = true;
    desktop.niri.enable = true;
    apps.nh.enable = true; # I should make a core module and put all cool modules in it.
  };
}
