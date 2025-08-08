{
  description = "NixOS :( :( !!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager/release-25.05";
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
  outputs =
    {
      self,
      nixpkgs,
      nixos-wsl,
      home-manager,
      stylix,
      chaotic,
      nixvim,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in
    {
      nixosConfigurations = {
         sunny = lib.nixosSystem {
          modules = [
            ./hosts/sunny
          ];
        };
        perry = lib.nixosSystem {
	  inherit system;
          modules = [
            ./hosts/perry
            stylix.nixosModules.stylix
            chaotic.nixosModules.nyx-cache
            chaotic.nixosModules.nyx-overlay
            chaotic.nixosModules.nyx-registry
          ];
        };
        wsl = lib.nixosSystem {
          inherit system;
          modules = [
            nixos-wsl.nixosModules.default
            ./wsl.nix
          ];
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
  sunny = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./homes/sunny
            nixvim.homeManagerModules.nixvim
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
