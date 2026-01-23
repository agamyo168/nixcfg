{
  config,
  lib,
  ...
}:
{
  options.nixosModules.services.calibre-web.enable = lib.mkEnableOption "Calibre Web Service";
  config = lib.mkIf config.nixosModules.services.calibre-web.enable {

    services.calibre-web = {
      enable = true;
      listen = {
    	ip = "0.0.0.0";
   	port = 8083;
 	};
	options = {
   	 calibreLibrary = "/media/books"; # Path to your books
    	 enableBookUploading = true;
    	 enableBookConversion = true;
  	};
};
  };
}
