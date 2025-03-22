{ ... }:
{
  imports = [
    ./docker.nix
    ./syncthing.nix
    ./nvidia.nix
    ./tailscale
  ];
}
