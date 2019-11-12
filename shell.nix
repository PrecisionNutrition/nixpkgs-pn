self: super:

let
    pkgs = import (builtins.fetchTarball {
      name = "nixos-19.03";  # Descriptive name
      url = https://github.com/nixos/nixpkgs-channels/archive/aea8dde8b321e373c71eb4e785c1cacd2824c878.tar.gz;
      sha256 = "092sw0igmnbxg3azkdijhydxl4r9gb1z0593c4nx1d09y3fb5gcb";
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
    '';

    basePackages = [
      self.yarn
      pkgs.python
      pkgs.nodejs-8_x
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
