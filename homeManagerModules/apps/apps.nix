{ config, lib, pkgs, ... }:
{
  options.modules.apps.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.apps.enable {

    home.packages = with pkgs; [
      #Apps programming
      nodejs_20
      #pkgs.python313
      (python3.withPackages (ps: with ps; [ numpy pandas jupyter ]))
      #python312Packages.jupyter-core opencv vscode
      #Database--
      dbeaver-bin
      #MySQL
      mysql84
      mysql-workbench
      #Postgres
      pgadmin4
      #utility
      postman #backend utility for proping/testing api
      ffmpeg_7
      mpv
      obs-studio
      krita
      htop
      fastfetch
      gparted
      libreoffice-qt
      pdfsam-basic #pdf utility
      shotcut #video editing UI
      #stow # tool for symlink managing
      # Security util
      burpsuite
    ];
  };
}
