{ pkgs, config, ... }:
{
  options.modules.niri.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.kde.enable {
    programs.niri = {
      enable = true;
      # xwayland.enable = true;
    };
  };

}
