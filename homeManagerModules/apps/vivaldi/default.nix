{ pkgs, lib, config, ... }:
{
  options.modules.vivaldi.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.vivaldi.enable {
    home.packages = with pkgs; [
      vivaldi
    ];
    programs.chromium = {
      package = pkgs.vivaldi;
      extensions = [
        "nngceckbapebfimnlniiiahkandclblb" #Bitwarden
        "ddkjiahejlhfcafbddmgiahcphecmpfh" #Ublock lite
      ];
    };

  };

}
