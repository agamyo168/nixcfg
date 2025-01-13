# This file manages all my shells
{ config, pkgs, ... }:
let
	myAliases = {
		ll = "ls -l";
		".." = "cd ..";
	};
in {
	programs.bash = {
		enable = true;
		shellAliases = myAliases;
	};
}
