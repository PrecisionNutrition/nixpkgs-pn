self: super:

let
    pkgs = import (builtins.fetchTarball {
      name = "nixos-20.03-2020-09-05";  # Descriptive name
      url = https://github.com/nixos/nixpkgs-channels/archive/51d115ac89d676345b05a0694b23bd2691bf708a.tar.gz;
      sha256 = "1gfjaa25nq4vprs13h30wasjxh79i67jj28v54lkj4ilqjhgh2rs";
    }) {};
in
{

  yarn = pkgs.yarn.overrideAttrs (oldAttrs: rec {
    version = "1.22.5";

    src = super.fetchzip {
      url = "https://github.com/yarnpkg/yarn/releases/download/v${version}/yarn-v${version}.tar.gz";
      sha256 = "1yb1pb80jhw6mx1r28hf7zd54dygmnrf30r3fz7kn9nrgdpl5in8";
    };

    buildInputs = [ pkgs.nodejs-12_x ];
  });
}
