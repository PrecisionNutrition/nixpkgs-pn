self: super:

let
    pkgs = import ( ./nix/sources.nix ) {};
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
      pkgs.nodejs-14_x
      pkgs.gnumake
      pkgs.gcc
      pkgs.readline
      pkgs.openssl
      pkgs.zlib
      pkgs.libxml2
      pkgs.curl
      pkgs.libiconv
      pkgs.watchman
    ];

    emberPkgs = if super.system == "x86_64-darwin" then
      basePackages ++ [super.darwin.apple_sdk.frameworks.CoreServices]
    else
      basePackages;
  };
}
