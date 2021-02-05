# Nixpkgs overlay which aggregates overlays for tools and products, used and
# published by PN.
self: super:

with super.lib;

(foldl' (flip extends) (_: super) (map import (import ./overlays.nix))) self
