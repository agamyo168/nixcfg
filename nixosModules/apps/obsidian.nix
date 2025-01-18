{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    #Apps
    obsidian
  	  
];
}
