{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.nixvim.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      enable = true;
      colorschemes.catppuccin.enable = true;
      plugins = {
        lualine.enable = true;
        #	cord.enable = true; #cord-nvim
        lazygit.enable = true;
      };
      extraPlugins = [ pkgs.vimPlugins.cord-nvim ];
      extraConfigLua = lib.fileContents ./init.lua;
    };

    home.packages = with pkgs; [
      #pkgs.nixpkgs-fmt # Nix language formatter!
      pkgs.treefmt2
    ];
  };
}
