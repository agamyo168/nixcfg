{
  inputs,
  config,
  pkgs,
  ...
}:
{
  #Install KiTTY because it works best with hyprland?
  environment.systemPackages = with pkgs; [
    #the compositor itself hyprland
    hyprland
    #a simple out of the box status bar
    waybar

    #notification
    #dunst
    swaynotificationcenter
    libnotify # dunst/swaync depends on libnotify to send notification
    #wallpaper daemon
    #swww
    hyprpaper # for background
    #app launcher
    rofi-wayland
    #wofi # default launcher for hyprland
    # fonts
    font-awesome
    nerdfonts
    noto-fonts-cjk-sans
    # screenshot tools
    hyprshot
    # Theme
    nwg-look # gtk theme editor
    catppuccin-gtk
    # lockscreen
    hyprlock
    # Terminal
    kitty
    starship
  ];

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "DroidSansMono"
        "Iosevka"
      ];
    })
  ];

  #Enabling hyprland on NixOS
  programs = {
    hyprland.enable = true; # Enables hyprland
    hyprland.xwayland.enable = true;
  };

  #services.xserver.enable = true;
  #services.xserver.displayManager.gdm.enable = true;  # Enable GDM
  #services.xserver.displayManager.gdm.wayland = true; # Enable Wayland support

  #desktop portals:

  #xdg.portal.enable = true;
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  #environment.sessionVariables = {
  # If your cursor becomes invisible
  #WLR_NO_HARDWARE_CURSOR = "1";
  # Hint electron apps to use wayland
  #NIXOS_OZONE_WL = "1";
  #};
}
