{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-wsl = {
    	url = "github:nix-community/NixOS-WSL/main";
        inputs.nixpkgs.follows = "nixpkgs";
    };
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
    # niri = {
    #   url = "github:sodiboo/niri-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = { self, nixpkgs,nixos-wsl, home-manager, stylix, nixvim, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in {
      nixosConfigurations = {
        perry = lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/perry stylix.nixosModules.stylix ];
	};
        wsl = lib.nixosSystem {
	  inherit system;
	  modules = [
	  nixos-wsl.nixosModules.default
	  ./wsl.nix ];
	};
      };
      homeConfigurations = {

         
        wsl = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
          ./homes/wsl
	  nixvim.homeManagerModules.nixvim
	  # niri.homeModules.niri
          ];
        };
 
        
        perry = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./homes/perry
            nixvim.homeManagerModules.nixvim
            # niri.homeModules.niri
          ];
        };
      };
    };
}
