{ pkgs, ... }:
{
  imports = [ ../../homeManagerModules ];
  nixpkgs.overlays = [ (import ../../overlays/jellyfin-rpc.nix) ];

  home.packages = with pkgs; [
    discord
    #pm2
    nodejs_24
    #STREAMING:
    android-studio
    youtube-music
    jellyfin-rpc
    #stremio
    windsurf
    syncplay
    btop
    nvtopPackages.full
    mpv
    #vivaldi
    obs-studio
    qbittorrent
    protonvpn-gui
    ghostty
    rar
    #wine64   #wine
    wineWowPackages.stable
    winetricks
    dbeaver-bin # dbeaver
    yaak
    postman
    ngrok
  ];

  # Programming Languages
  nixpkgs.config.android_sdk.accept_license = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  modules = {
    niri.enable = true;
    discord.enable = false;
    obsidian.enable = true;
    vscodium.enable = true;
    git.enable = true;
    distrobox.enable = true;
    nixvim.enable = true;
    firefox.enable = true;
    vivaldi.enable = true;
    caprine.enable = true;
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jimbo";
  home.homeDirectory = "/home/jimbo";
  # allow unfree software
  nixpkgs.config.allowUnfree = true; # You should use predicate
  home.stateVersion = "24.11"; # Please read the comment before changing.
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
