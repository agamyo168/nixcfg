{ lib, pkgs, ... }:
{
  imports = [ ../../homeManagerModules ];

  modules = {

    git.enable = true;
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sunny";
  home.homeDirectory = "/home/sunny";
  # allow unfree software
  nixpkgs.config.allowUnfree = true; # You should use predicate
  home.stateVersion = "24.11"; # Please read the comment before changing.
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
