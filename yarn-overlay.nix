self: super:

let
    pkgs = import (builtins.fetchTarball {
      name = "nixos-unstable-2020-12-20";  # Descriptive name
      url = "https://github.com/NixOS/nixpkgs/archive/e9158eca70ae59e73fae23be5d13d3fa0cfc78b4.tar.gz";
      sha256 = "0cnmvnvin9ixzl98fmlm3g17l6w95gifqfb3rfxs55c0wj2ddy53";
    }) {};
in
{

  yarn = pkgs.yarn.overrideAttrs (oldAttrs: rec {
    version = "1.22.5";

    src = super.fetchzip {
      url = "https://github.com/yarnpkg/yarn/releases/download/v${version}/yarn-v${version}.tar.gz";
      sha256 = "1yb1pb80jhw6mx1r28hf7zd54dygmnrf30r3fz7kn9nrgdpl5in8";
    };

    buildInputs = [ pkgs.nodejs-14_x ];
  });
}
