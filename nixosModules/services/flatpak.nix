{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [ flatpak ];

  # Enable Flatpak
  services.flatpak.enable = true;
}
