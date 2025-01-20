{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-tweaks
    #https://github.com/SUPERCILEX/gnome-clipboard-history
    gnomeExtensions.clipboard-history # Alt + F2 then r to restart gnome shell then write this to terminal gnome-extensions enable clipboard-history@alexsaveau.dev
  ];
}
