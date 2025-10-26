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
      clipboard.register = "unnamedplus";
      keymaps = [
        # Search
        {
          mode = "n";
          key = "<leader>ff";
          action = "<cmd>Telescope find_files<cr>";
          options.desc = "Find files";
        }
      ];
      lsp.keymaps = [
        {
          key = "gd";
          lspBufAction = "definition";
        }
        {
          key = "gD";
          lspBufAction = "references";
        }
        {
          key = "gt";
          lspBufAction = "type_definition";
        }
        {
          key = "gi";
          lspBufAction = "implementation";
        }
        {
          key = "K";
          lspBufAction = "hover";
        }
      ];
      colorschemes.catppuccin.enable = true;
      plugins = {
        #lualine.enable = true;
        cord.enable = true; # cord-nvim
        lsp = {
          enable = true;
          inlayHints = true;
          servers = {
            nixd.enable = true;
            gopls.enable = true;
          };
        };
        lazygit.enable = true;
        web-devicons.enable = true;
        telescope.enable = true;
        conform-nvim = {
          enable = true;
          settings = {
            format_on_save = {
              timeout_ms = 500;
              lsp_format = "fallback";
            };
            formatters_by_ft = {
              "*" = [ "injected" ]; # Formats code blocks
              nix = [ "nixfmt" ];
              rust = [ "rustfmt" ];
              go = [ "golines" ];
            };
          };

        };
      };
      #extraPlugins = [ pkgs.vimPlugins.cord-nvim ];
      extraConfigLua = lib.fileContents ./init.lua;
    };

    home.packages = with pkgs; [
      #pkgs.nixpkgs-fmt # Nix language formatter!
      pkgs.treefmt
    ];
  };
}
