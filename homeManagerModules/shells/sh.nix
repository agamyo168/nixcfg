# This file manages all my shells
{ config, pkgs, ... }:

let
  myAliases = {
    ll = "eza -lh --icons --grid --group-directories-first";
    cd = "z";
    #".." = "cd ..";
    dotfiles = "cd ~/.dotfiles";
    "flake-switch:perry" = "sudo nixos-rebuild switch --flake ~/.dotfiles#perry";
    "home-switch:perry" = "home-manager switch --flake ~/.dotfiles#perry";
    "flake-update:perry" = "nix flake update";
    "flake-boot:perry" = "sudo nixos-rebuild boot --flake ~/.dotfiles#perry";
    "flake-test:perry" = "sudo nixos-rebuild test --flake ~/.dotfiles#perry";
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
  programs.eza = {
    enable = true;
    git = true;
  };
  programs.zoxide = {
    enable = true;
  };
  home.packages = with pkgs; [
    fzf
    kitty
  ];
}
