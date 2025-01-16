{config, pkgs,...}:
{
  environment.systemPackages = [
    #Apps
    pkgs.docker_27
    pkgs.docker-compose
  	  
];
  virtualisation.docker.enable = true;
}
