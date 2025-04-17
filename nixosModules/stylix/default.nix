{ pkgs, ... }: {
  stylix.enable = true;

  stylix.base16Scheme =
    "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";

  stylix.polarity = "dark";
  # Don't forget to apply wallpaper

  stylix.image = ../../wallpaper/moon.png;
}
