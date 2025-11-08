{ pkgs, ... }:
{

  stylix.enable = true;
  #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  #stylix.polarity = "dark";
  # Don't forget to apply wallpaper
  #  stylix.image = "~/wallpapers/gruvbox.png";

}
