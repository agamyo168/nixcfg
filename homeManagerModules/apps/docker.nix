{config, pkgs,...}:
{
  environment.systemPackages = with pkgs; [
    #Apps
    docker_27
    docker-compose
  	  
];
  virtualisation.docker.enable = true;
}
