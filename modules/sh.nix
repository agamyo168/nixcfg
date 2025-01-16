# This file manages all my shells
{ config, pkgs, ... }:
let
	myAliases = {
		ll = "ls -l";
		".." = "cd ..";
		dotfiles = "cd ~/.dotfiles";
	};
in {
	programs.bash = {
		enable = true;
		shellAliases = myAliases;
	};
}
