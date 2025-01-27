{ pkgs, config, ... }:
let
  yt-dlp-override = pkgs.yt-dlp.overrideAttrs (oldAttrs: {
    version = "2025.01.26";
    src = pkgs.fetchFromGitHub {
      owner = "yt-dlp";
      repo = "yt-dlp";
      rev = "2025.01.26";
      sha256 = "sha256-bjvyyCvUpZNGxkFz2ce6pXDSKXJROKZphs9RV4CBs5M=";
    };
  });
in
{
  home.packages = [ yt-dlp-override ];
}

