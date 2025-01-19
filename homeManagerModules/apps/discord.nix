{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    discord
  ];

}
