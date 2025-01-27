{ lib
, pkgs
, ...
}: {
  imports = [
    ../../homeManagerModules/home
  ];

  home.packages = with pkgs; [
    obsidian
    nautilus
    obs-studio
    lunar-client
    vlc
    vesktop
  ];

  modules = {
    # X11
    i3.enable = true;
    alacritty.enable = true;
    polybar.enable = true;
    dunst.enable = true;

    # Wayland
    sway.enable = true;
    hyprland.enable = true;
    waybar.enable = true;
    foot.enable = true;
    mako.enable = true;
    wofi.enable = true;

    git.enable = true;
    theme.enable = true;
    firefox.enable = true;
    fish.enable = true;

    # Development
    vscode.enable = true;
    direnv.enable = true;
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "perry";
  home.homeDirectory = "/home/perry";
  # allow unfree software
  nixpkgs.config.allowUnfree = true; # You should use predicate
  home.stateVersion = "24.11"; # Please read the comment before changing.
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
