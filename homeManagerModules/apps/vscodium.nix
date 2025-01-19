{ config, pkgs, ... }:
{
  # This installs vscodium and sets up extensions
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide # Nix language LSP
    ];
  };
  home.packages = with pkgs; [
    pkgs.nixpkgs-fmt # Nix language formatter
  ];
}
