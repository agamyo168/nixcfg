{ pkgs, config, ... }:
{
  # home.packages = with pks; [ noisetorch ];
  programs.noisetorch = {
    enable = true;
  };
}
