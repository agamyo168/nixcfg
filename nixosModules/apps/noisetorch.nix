{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [ noisetorch ];
  programs.noisetorch.enable = true;
}
