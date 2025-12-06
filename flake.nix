{
  description = "NixOS :( :( !!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
          specialArgs = {
            conHost = "sunny";
            conUsername = "sunny";
            conHome = "/home/sunny";
            conFlakePath = "/home/sunny/nixcfg";
          };
          modules = [
            ./hosts/sunny
          ];
        };
        perry = lib.nixosSystem {
          specialArgs = {
            conHost = "perry";
            conUsername = "jimbo";
            conHome = "/home/jimbo";
            conFlakePath = "/home/jimbo/.dotfiles";
          };
          modules = [
            ./hosts/perry
            stylix.nixosModules.stylix
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

        focus = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./homes/focus
            nixvim.homeManagerModules.nixvim
          ];
        };

        perry = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./homes/perry
            nixvim.homeManagerModules.nixvim
            stylix.homeModules.stylix
          ];
        };
      };
    };
}
