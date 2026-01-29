{
  lib,
  pkgs,
  config,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.niri.enable = mkEnableOption "";
  config = mkIf config.modules.niri.enable {

    xdg = {
      configFile."niri/config.kdl".source = ./config.kdl;
      mimeApps = {
        enable = true;
        defaultApplications = {
          "application/pdf" = [ "zathura.desktop" ]; # .pdf
          "text/*" = [ "emacsclient.desktop" ]; # Any text files
          "video/*" = [ "mpv.desktop" ]; # Any video files
          "x-scheme-handler/https" = [ "firefox.desktop" ]; # Links
          "x-scheme-handler/http" = [ "firefox.desktop" ]; # Links
          "x-scheme-handler/mailto" = [ "firefox.desktop" ]; # Links
          "image/*" = [ "feh.desktop" ]; # Images
          "image/png" = [ "feh.desktop" ];
          "image/jpeg" = [ "feh.desktop" ];
        };
      };
    };

    stylix.enable = true;
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    stylix.autoEnable = false;
    #
    stylix.targets = {
      gtk.enable = true;
      #qt.enable = false; # This is probably causing KDE to shut black
    };
    programs.swaylock = {
      enable = true;
      settings = {
        color = "282828"; # Gruvbox Background (bg0)
        bs-hl-color = "928374"; # Gruvbox Gray (gray) - Backspace Highlight
        caps-lock-bs-hl-color = "928374"; # Gruvbox Gray (gray)
        caps-lock-key-hl-color = "98971A"; # Gruvbox Green
        inside-color = "00000000";
        inside-clear-color = "00000000";
        inside-caps-lock-color = "00000000";
        inside-ver-color = "00000000";
        inside-wrong-color = "00000000";
        key-hl-color = "98971A"; # Gruvbox Green
        layout-bg-color = "00000000";
        layout-border-color = "00000000";
        layout-text-color = "FBF1C7"; # Gruvbox Foreground (fg)
        line-color = "00000000";
        line-clear-color = "00000000";
        line-caps-lock-color = "00000000";
        line-ver-color = "00000000";
        line-wrong-color = "00000000";
        ring-color = "B16286"; # Gruvbox Purple
        ring-clear-color = "D79921"; # Gruvbox Yellow (for "clear" action)
        ring-caps-lock-color = "D65D0E"; # Gruvbox Orange
        ring-ver-color = "458588"; # Gruvbox Blue (for "verification" action)
        ring-wrong-color = "CC241D"; # Gruvbox Red (for "wrong" action)
        separator-color = "00000000";
        text-color = "FBF1C7"; # Gruvbox Foreground (fg)
        text-clear-color = "D79921"; # Gruvbox Yellow
        text-caps-lock-color = "D65D0E"; # Gruvbox Orange
        text-ver-color = "458588"; # Gruvbox Blue
        text-wrong-color = "CC241D"; # Gruvbox Red
        image = ''~/wallpapers/gruvbox.png'';
      };
    }; # Super+Alt+L in the default setting (screen locker)

    services.network-manager-applet.enable = true;
    #programs.alacritty.enable = true; # Super+T in the default setting (terminal)
    #programs.fuzzel.enable = true; # Super+D in the default setting (app launcher)
    programs.waybar.enable = true; # launch on startup in the default setting (bar)
    services.swayidle.enable = true; # idle management daemon
    services.swaync.enable = true; # notification daemon
    #services.mako.enable = true; # notification daemon

    services.polkit-gnome.enable = true; # polkit
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
      ];
      config = {
        niri = {
          default = [ "gtk" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
          "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
        };
      };
    };

    # (App launcher)
    programs.vicinae = {
      enable = true;
    };
    home.packages = with pkgs; [
      swaybg # wallpaper
      #      (flameshot.override { enableWlrSupport = true; })
      xwayland-satellite # this fixes X11 apps not running
      playerctl # mpris
      pavucontrol # audio control
      #screenshot editing tool
      vicinae
      gradia
      slurp
      zathura
      feh
      wayfreeze
      #grim
    ];
  };
}
