self: super:

{
  yarn = super.yarn.overrideAttrs (oldAttrs: rec {
    version = "1.19.0";

    src = super.fetchzip {
      url = "https://github.com/yarnpkg/yarn/releases/download/v${version}/yarn-v${version}.tar.gz";
      sha256 = "14h293kixxiww41daj0xyjii8d9mgr2ah5sxadass60p61ynxsq4";
    };

    buildInputs = [ super.nodejs ];
  });
}
