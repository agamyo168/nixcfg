{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.vscodium.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.vscodium.enable {
    # This installs vscodium and sets up extensions
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
     profiles.default.extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide # Nix language LSP
      ];
    };
    home.packages = with pkgs; [
      #pkgs.nixpkgs-fmt # Nix language formatter!
      pkgs.nixfmt-rfc-style
      pkgs.treefmt
    ];
  };
}
