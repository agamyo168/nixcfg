{pkgs, lib, ...}:{
  options.modules.niri.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.niri.enable {
	programs.niri.enable = true;
 }
}
