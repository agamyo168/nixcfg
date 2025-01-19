{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Prettier but for Nix language
    nixpkgs-fmt
    vscodium
  ];
}
