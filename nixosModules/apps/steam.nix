{ pkgs, config, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };
  environment.systemPackages = with pkgs; [ mangohud lutris];
  programs.gamemode.enable = true;
}
