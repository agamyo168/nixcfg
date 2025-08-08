{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    #Apps
    syncthing
  ];
  services.syncthing = {
  	enable = true;
	group = "syncthing";
	user = "jimbo";
	dataDir = "/home/jimbo/Documents";    # Default folder for new synced folders
        configDir = "/home/jimbo/Documents/.config/syncthing";   # Folder for Syncthing's settings and keys
	openDefaultPorts = true;
};
  #services.syncthing = {
  #enable = true;
  #   dataDir = "/home/jimbo"; # default location for new folders
  #   configDir = "/home/jimbo/.config/syncthing";
  #   settings = {
  #     folders = {
  #       "m8x7g-n23fg" = {
  #         # Name of folder in Syncthing, also the folder ID
  #         path = "/home/jimbo/Obsidian"; # Which folder to add to Syncthing
  #         # devices = [ "device1" "device2" ]; # Which devices to share the folder with
  #       };
  #     };
  #     openDefaultPorts = true;
  #   };
  #};
}
