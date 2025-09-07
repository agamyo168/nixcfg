{ lib, pkgs, ... }:
{
  imports = [ ../../homeManagerModules ];
  home.packages = with pkgs; [
    nodejs_20
    stremio
    windsurf
    syncplay
    btop
    mpv
    obs-studio
  ];

  modules = {
    discord.enable = false;
    obsidian.enable = true;
    vscodium.enable = true;
    git.enable = true;
    distrobox.enable = true;
    nixvim.enable = true;
    firefox.enable = true;
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
