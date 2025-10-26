{ pkgs, config, lib, ... }:
{
   options.modules.caprine.enable = lib.mkEnableOption "Caprine Enabled";
   config = lib.mkIf config.modules.caprine.enable {
   	 home.packages = with pkgs; [
    		caprine
  		];
   };
}
