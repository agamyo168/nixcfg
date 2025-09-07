{
  config,
  pkgs,
  lib,
  conHome,
  conUsername,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    #Apps
    syncthing
  ];
  systemd.services.syncthing.wantedBy = [ "multi-user.target" ];
  services.syncthing = {
    enable = true;
    dataDir = conHome;
    user = conUsername;
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384";
    #group = "users";
    configDir = conHome+"/.config/syncthing";
     overrideDevices = true;
     overrideFolders = true;
    settings.options.relaysEnabled = false;
    settings = {
      devices = {
		"perry" = {
		 id = "OOKCAIU-NTTO2XW-NYGYI53-GPRZR7U-T64CPD4-EPNTXCK-4B6NQUK-KWG7JAA";
		};
		"headless-server"= {
		 id = "XZ42EMW-HZG43FI-ZHQTJBU-KCMR6TU-OSTMWXM-537GFKC-WPRXZ4P-POY4IQS";
		};
		"phone" = {
		 id = "NG6YHHC-MM3LLDC-MV6SDZX-HHAYLBV-YYLT55V-MN75LJY-7HIH3IQ-OO67GAQ";
		};
	};
	folders = {
		"m8x7g-n23fg" = {
		   label = "Obsidian";
		   path = conHome + "/Obsidian";
		   devices = [
			"perry"
			"headless-server"
			"phone"
		   ];
		};
	};
    };
  };

}
