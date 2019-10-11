self: super:

{
  shellStuff = super.stdenv.mkDerivation rec {
    emberShellHooks = ''
      mkdir -p .nix-node
      export NODE_PATH=$PWD/.nix-node
      export NPM_CONFIG_PREFIX=$PWD/.nix-node
      export PATH=$NODE_PATH/bin:$PATH
    '';

    basePackages = [
      self.yarn
      super.python
      super.nodejs-10_x
      super.gnumake
      super.gcc
      super.readline
      super.openssl
      super.zlib
      super.libxml2
      super.curl
      super.libiconv
    ];

    emberPkgs = if super.system == "x86_64-darwin" then
      basePackages ++ [super.darwin.apple_sdk.frameworks.CoreServices]
    else
      basePackages;
  };
}
