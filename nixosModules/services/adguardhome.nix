{ pkgs, lib, config, ... }: 
{
  options.nixosModules.services.adguard.enable = lib.mkEnableOption "Adguard enabled";
  environmen.systemPackages = with; pkgs [
	adguardhome
  ]; 
}
