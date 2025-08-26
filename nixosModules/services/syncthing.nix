{
  config,
  pkgs,
  lib,
  conHome,
  conUsername,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    #Apps
    syncthing
  ];
  systemd.services.syncthing.wantedBy = [ "multi-user.target" ];
  services.syncthing = {
    enable = true;
    dataDir = conHome;
    user = conUsername;
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384";
    #group = "users";
    configDir = conHome+"/.config/syncthing";
    # overrideDevices = true;
    # overrideFolders = true;
     settings.options.relaysEnabled = false;
  };
}
