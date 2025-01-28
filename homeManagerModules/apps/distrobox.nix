{ pkgs, lib, config, ... }: {
  options.modules.distrobox.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.distrobox.enable {
    home.packages = with pkgs; [ distrobox ];
  };

}
