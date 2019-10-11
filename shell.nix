self: super:

with super;
{
  shellStuff = super.stdenv.mkDerivation rec {
    emberShellHooks = ''
      mkdir -p .nix-node
      export NODE_PATH=$PWD/.nix-node
      export NPM_CONFIG_PREFIX=$PWD/.nix-node
      export PATH=$NODE_PATH/bin:$PATH
    '';

    basePackages = [
      python
      nodejs-10_x
      pkgs.yarn
      gnumake
      gcc
      readline
      openssl
      zlib
      libxml2
      curl
      libiconv
    ];

    emberPkgs = if system == "x86_64-darwin" then
      basePackages ++ [darwin.apple_sdk.frameworks.CoreServices]
    else
      basePackages;
  };
}
