{ pkgs, configs, ... }: {
  options.modules.git.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.git.enable {
    home.packages = with pkgs; [ distrobox ];
  };

}
