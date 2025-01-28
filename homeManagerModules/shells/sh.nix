# This file manages all my shells
{ config, pkgs, ... }:

let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    dotfiles = "cd ~/.dotfiles";
    "flake-switch" = "sudo nixos-rebuild switch --flake ~/.dotfiles#(prompt_hostname)";
    "home-switch" = "home-manager switch --flake ~/.dotfiles#(prompt_hostname)";
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
