{ config, pkgs, ... }:
{
  options.modules.git.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.git.enable {
    programs.nixvim = {
      enable = true;
      colorschemes.catppuccin.enable = true;
      plugins.lualine.enable = true;
    };
  };
}
