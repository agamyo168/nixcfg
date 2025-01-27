{ pkgs, config, ... }:
{
  programs.niri = {
    enable = true;
    # xwayland.enable = true;
  };
}
