# Nixpkgs overlay which aggregates overlays for tools and products, used and
# published by PN.
self: super: {
	yarn = super.yarn.overrideAttrs (oldAttrs: rec {
		version = "1.19.0";

		src = super.fetchzip {
			url = "https://github.com/yarnpkg/yarn/releases/download/v${version}/yarn-v${version}.tar.gz";
			sha256 = "14h293kixxiww41daj0xyjii8d9mgr2ah5sxadass60p61ynxsq4";
		};
		buildInputs = [ super.nodejs-10_x ];
	});

  shellStuff = super.stdenv.mkDerivation rec {
    emberShellHooks = ''
      mkdir -p .nix-node
      export NODE_PATH=$PWD/.nix-node
      export NPM_CONFIG_PREFIX=$PWD/.nix-node
      export PATH=$NODE_PATH/bin:$PATH
    '';

    basePackages = [
      yarn
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
