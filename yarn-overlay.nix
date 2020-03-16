self: super:

let
    pkgs = import (builtins.fetchTarball {
      name = "nixos-19.09-2020-02-05";  # Descriptive name
      url = https://github.com/nixos/nixpkgs-channels/archive/ea553d8c67c6a718448da50826ff5b6916dc9c59.tar.gz;
      sha256 = "0g9smv36sk42rfyzi8wyq2wl11c5l0qaldij1zjdj60s57cl3wgj";
    }) {};
in
{

  yarn = pkgs.yarn.overrideAttrs (oldAttrs: rec {
    version = "1.22.4";

    src = super.fetchzip {
      url = "https://github.com/yarnpkg/yarn/releases/download/v${version}/yarn-v${version}.tar.gz";
      sha256 = "0hbsdbrqx5xhr171ik862v51xwjzbfncic92pgbnhnlmxy2y974x";
    };

    buildInputs = [ pkgs.nodejs-12_x ];
  });
}
