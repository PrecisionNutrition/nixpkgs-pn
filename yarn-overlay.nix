self: super:

{

  yarn = super.yarn.overrideAttrs (oldAttrs: rec {
    version = "1.19.0";
    pkgs = import (builtins.fetchTarball {
      name = "nixos-19.03";  # Descriptive name
      url = https://github.com/nixos/nixpkgs-channels/archive/aea8dde8b321e373c71eb4e785c1cacd2824c878.tar.gz;
      sha256 = "092sw0igmnbxg3azkdijhydxl4r9gb1z0593c4nx1d09y3fb5gcb";
    }) {};

    src = super.fetchzip {
      url = "https://github.com/yarnpkg/yarn/releases/download/v${version}/yarn-v${version}.tar.gz";
      sha256 = "14h293kixxiww41daj0xyjii8d9mgr2ah5sxadass60p61ynxsq4";
    };

    buildInputs = [ pkgs.nodejs-8_x ];
  });
}
