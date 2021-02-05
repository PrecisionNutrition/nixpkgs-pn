# we use custom yarn to ensure it links to the right version of node
self: super:

let
    sources = import ( ./nix/sources.nix ) {};
    pkgs = import sources.nixpkgs {};
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
