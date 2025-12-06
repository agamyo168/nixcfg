{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #Apps
    docker_28
    docker-compose

  ];
  virtualisation.docker.enable = true;
}
