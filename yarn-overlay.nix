self: super:

let
    pkgs = import (builtins.fetchTarball {
      name = "nixos-20.03-2020-09-05";  # Descriptive name
      url = https://github.com/nixos/nixpkgs-channels/archive/51d115ac89d676345b05a0694b23bd2691bf708a.tar.gz;
      sha256 = "0g9smv36sk42rfyzi8wyq2wl11c5l0qaldij1zjdj60s57cl3wgj";
    }) {};
in
{

  yarn = pkgs.yarn.overrideAttrs (oldAttrs: rec {
    version = "1.22.5";

    src = super.fetchzip {
      url = "https://github.com/yarnpkg/yarn/releases/download/v${version}/yarn-v${version}.tar.gz";
      sha256 = "0hbsdbrqx5xhr171ik862v51xwjzbfncic92pgbnhnlmxy2y974x";
    };

    buildInputs = [ pkgs.nodejs-12_x ];
  });
}
