{
  config,
  lib,
  ...
}:
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
    # SSH AGENT
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      #      matchBlock = "*";

    };
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
      };
    };
  };

}
