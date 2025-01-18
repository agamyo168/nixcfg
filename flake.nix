{
	description = "My first flake!";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
		home-manager.url = "github:nix-community/home-manager/release-24.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
       	        stylix = {
			url = "github:danth/stylix/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
			};
		nixvim = {
   	        # url = "github:nix-community/nixvim";
	        # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
	        url = "github:nix-community/nixvim/nixos-24.11";
	   	inputs.nixpkgs.follows = "nixpkgs";
	  	};		
	};
	outputs = { self, nixpkgs, home-manager, stylix, ... }:
	let 
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				inherit system;
				modules = [
					 ./hosts/jimbo/configuration.nix
						 ];
			};
			perry = lib.nixosSystem {
				inherit system;
				modules = [
				 ./hosts/perry/configuration.nix
				 ./nixosModules
				 stylix.nixosModules.stylix
				 ];
			};
		};
		homeConfigurations = {
			jimbo = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ 
				   ./home.nix
				   ./homeManagerModules
				 ];
			};
		};
	};
}
