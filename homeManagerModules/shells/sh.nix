# This file manages all my shells
{ config, pkgs, ... }:

let
  myAliases = {
    ll = "eza -l";
    ".." = "cd ..";
    dotfiles = "cd ~/.dotfiles";
    "flake-switch" = "sudo nixos-rebuild switch --flake ~/.dotfiles#perry";
    "home-switch:perry" = "home-manager switch --flake ~/.dotfiles#perry";
    "flake:update" = "nix flake update";
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
  home.packages = with pkgs; [ fzf eza ];
}
