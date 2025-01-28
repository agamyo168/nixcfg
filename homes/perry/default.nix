{ lib
, pkgs
, ...
}: {
  imports = [
    ../../homeManagerModules
  ];

  home.packages = with pkgs; [
    #Apps programming
    nodejs_20
    #pkgs.python313
    (python3.withPackages (ps: with ps; [ numpy pandas jupyter ]))
    #python312Packages.jupyter-core opencv vscode
    #Database--
    dbeaver-bin
    #MySQL
    # mysql84
    # mysql-workbench
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

  modules = {

    discord.enable = true;
    obsidian.enable = true;
    gnome-extensions.enable = true;
    vscodium.enable = true;
    git.enable = true;
    distrobox.enable = true;
    nixvim.enable = true;
    vivaldi.enable = true;
    firefox.enable = true;

  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jimbo";
  home.homeDirectory = "/home/jimbo";
  # allow unfree software
  nixpkgs.config.allowUnfree = true; # You should use predicate
  home.stateVersion = "24.11"; # Please read the comment before changing.
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
