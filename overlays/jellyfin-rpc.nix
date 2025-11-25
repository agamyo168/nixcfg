final: prev: {
  # Next time just overrideAttrs instead of making an overlay
  # Use overlays for customizing or downloading a package not on nixpkgs?
  jellyfin-rpc = prev.jellyfin-rpc.overrideAttrs (oldAttrs: rec {
    src = prev.fetchFromGitHub {
      owner = "Radiicall";
      repo = "jellyfin-rpc";
      rev = "92677b337cb80e2e882b7c9fb182e3d475b82720";
      sha256 = "g4Vd++Q6rJS6nU1kR+7aItnhHc0jeFSU460iF6P1EEk=";

    };
    #cargoSha256 = "";
    cargoDeps = oldAttrs.cargoDeps.overrideAttrs (prev: {
      vendorStaging = prev.vendorStaging.overrideAttrs {
        inherit src;
        # Deliberately invalid hash -- I'm not sure how to effectively
        # pre-determine it.
        outputHash = "sha256-ltEm3hFiHBM4NtYg1qrFH26jMDgWa+al06P6O/Su1XA=";
      };
    }
    #prev.lib.const {
    #  inherit src;
    #  outputHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    #outputHash = "sha256-XXXXXXXXXXXXXX1kR+7aItnhHc0jeFSU460iF6P1EEk=";
    #}
    );
  });
}
