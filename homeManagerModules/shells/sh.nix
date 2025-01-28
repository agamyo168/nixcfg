# This file manages all my shells
{ config, pkgs, ... }:

let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    dotfiles = "cd ~/.dotfiles";
    "flake-switch" = "sh sudo nixos-rebuild switch --flake ~/.dotfiles#$HOSTNAME";
    "home-switch" = "sh home-manager switch --flake ~/.dotfiles#$HOSTNAME";
  };
in
{
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
  programs.fish = {
    enable = true;
    shellAliases = myAliases;
  };
  # Terminal
  programs.starship = {
    enable = true;
  };
}
