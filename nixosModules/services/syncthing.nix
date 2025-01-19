{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #Apps
    syncthing
  ];
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };
}
