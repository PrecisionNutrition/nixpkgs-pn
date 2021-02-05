self: super:

let
  sources = import (./nix/sources.nix) { };
in {
  nixpkgs = sources.nixpkgs;
}
