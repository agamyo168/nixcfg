{ lib, pkgs, ... }:
{
  imports = [ ../../homeManagerModules ];

  home.packages = with pkgs; [
    #Apps programming
    nodejs_20
    #pkgs.python313
    (python3.withPackages (
      ps: with ps; [
        numpy
        pandas
        jupyter
      ]
    ))
    #python312Packages.jupyter-core opencv vscode

    #Database--
    dbeaver-bin
    mysql-workbench
    pgadmin4

    #utility
    btop
    fastfetch
    gparted
    libreoffice-qt
    pdfsam-basic # pdf utility
    anki # flashcards
    ventoy-full
    syncplay
    #syncthing

    #network
    burpsuite
    postman # backend utility for proping/testing api
    ngrok
    #tailscale

    #media
    mpv
    shotcut # video editing UI
    ffmpeg_7
    obs-studio
    krita

    #ssh
    snips-sh
    #nix
    rippkgs
    tealdeer
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
