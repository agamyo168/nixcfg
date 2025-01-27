{ config, lib, pkgs, ... }:
{
  options.modules.git.enable = lib.mkEnableOption "";
  config = lib.mkIf config.modules.git.enable {
    programs.gh = {
      enable = true;
      settings = {
        version = "1";
        aliases = {
          "as" = "auth status";
        };
      };
    };
    programs.git = {
      enable = true;
      userName = "agamyo168";
      userEmail = "agamyo168@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
