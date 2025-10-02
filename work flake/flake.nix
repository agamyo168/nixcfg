{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # Optional: Declarative tap management
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            pkgs.vim
            pkgs.nixfmt
            pkgs.mkalias
            pkgs.minikube
          ];
          # Homebrew
          homebrew = {
            enable = true;
            casks = [
              "the-unarchiver"
              "obsidian"
              "postman"
              "windsurf"
              "visual-studio-code"
              "zen"
              "firefox" # side chick
              "shottr"
              "burp-suite"
              "android-studio"
              "dotnet-sdk"
              "kitty"
              "github"
            ];
            brews = [
              "ollama"
              "ca-certificates"
              "docker"
              "starship"
              "docker-completion"
              "docker-compose"
              "gh"
              "git"
              "node"
              "btop"
            ];
            #masApps = {};
            onActivation.cleanup = "zap"; # Deletes any application not installed declaratively.
          };

          # Allow non open source apps
          nixpkgs.config.allowUnfree = true;

          # Should Fix Spotlight not detecting apps
          system.activationScripts.applications.text =
            let
              env = pkgs.buildEnv {
                name = "system-applications";
                paths = config.environment.systemPackages;
                pathsToLink = "/Applications";
              };
            in
            pkgs.lib.mkForce ''
              # Set up applications.
              echo "setting up /Applications..." >&2
              rm -rf /Applications/Nix\ Apps
              mkdir -p /Applications/Nix\ Apps
              find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
              while read -r src; do
                app_name=$(basename "$src")
                echo "copying $src" >&2
                ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
              done
            '';

          #fonts
          fonts.packages = [
            pkgs.nerd-fonts.jetbrains-mono
            pkgs.nerd-fonts.fira-code 
          ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          programs.fish = {

            enable = true;
            loginShellInit = "starship init fish | source";
          };

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;
          # users
          system.primaryUser = "omargamal";
          users.knownUsers = [ "omargamal" ];
          users.users.omargamal.uid = 501;
          users.users.omargamal.shell = pkgs.fish;
          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Omars-Mac-mini
      darwinConfigurations."Omars-Mac-mini" = nix-darwin.lib.darwinSystem {
        modules = [

          configuration

          # Home brew
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "omargamal";

              # Automatically migrate existing Homebrew installations
              autoMigrate = true;
            };
          }

        ];
      };
    };
}
