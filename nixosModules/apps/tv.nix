{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.nixosModules.apps.tv.enable = lib.mkEnableOption "TV Service";
  config = lib.mkIf config.nixosModules.apps.tv.enable {
    environment.systemPackages = with pkgs; [
      jellyfin-ffmpeg
      jellyfin-web
      bazarr
      varia
      jellyfin
    ];
    # Enable Deluge
    services.deluge = {
      enable = true;
      web.enable = true;
      web.openFirewall = true;
      #openFirewall= true;
      dataDir = "/media/deluge/";
      group = "multimedia";
    };
    # Jellyseerr
    services.jellyseerr = {
      enable = true;
      openFirewall = true;
    };

    # Enable Jellyfin
    services.jellyfin = {
      enable = true;
      openFirewall = true;
      user = "jellyfin";
      #dataDir = "/media/jellyfin";
      #group ="multimedia";
    };
    # Enable Sonarr
    services.sonarr = {
      enable = true;
      openFirewall = true;
      group = "multimedia";
      dataDir = "/media/sonarr";
    };
    # Enable Radarr
    services.radarr = {
      enable = true;
      openFirewall = true;
      group = "multimedia";
      dataDir = "/media/radarr";
    };

    # Enable Prowlarr
    services.prowlarr = {
      enable = true;
      openFirewall = true;
    };
  };

}
