{ config, pkgs, ... }:
{
  programs = {
 	gh = { 
	   enable = true;
	  };
	git.enable = true;
	};
}
