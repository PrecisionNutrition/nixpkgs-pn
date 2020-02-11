self: super:

let
    pkgs = import (builtins.fetchTarball {
      name = "nixos-19.09-2020-02-05";  # Descriptive name
      url = https://github.com/nixos/nixpkgs-channels/archive/ea553d8c67c6a718448da50826ff5b6916dc9c59.tar.gz;
      sha256 = "0g9smv36sk42rfyzi8wyq2wl11c5l0qaldij1zjdj60s57cl3wgj";
    }) {};
in
{
  shellStuff = super.stdenv.mkDerivation rec {
    emberShellHooks = ''
      mkdir -p .nix-node
      export NODE_PATH=$PWD/.nix-node
      export NPM_CONFIG_PREFIX=$PWD/.nix-node
      export PATH=$NODE_PATH/bin:$PATH
      export PS1='\n\[\033[1;32m\][nix-shell:\w]($(git rev-parse --abbrev-ref HEAD))\$\[\033[0m\] '

      # https://blog.npmjs.org/post/189618601100/binary-planting-with-the-npm-cli
      if [ $(npm -v | grep -v 6.13.4) ]; then npm install -g npm@6.13.4; fi
    '';

    basePackages = [
      self.yarn
      pkgs.python
      pkgs.nodejs-12_x
      pkgs.gnumake
      pkgs.gcc
      pkgs.readline
      pkgs.openssl
      pkgs.zlib
      pkgs.libxml2
      pkgs.curl
      pkgs.libiconv
    ];

    emberPkgs = if super.system == "x86_64-darwin" then
      basePackages ++ [super.darwin.apple_sdk.frameworks.CoreServices]
    else
      basePackages;
  };
}
