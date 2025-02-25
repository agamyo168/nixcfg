{ config, lib, pkgs, ... }:
{
  options.modules.nixvim.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      enable = true;
      colorschemes.catppuccin.enable = true;
      plugins.lualine.enable = true;
    };
  };
}
