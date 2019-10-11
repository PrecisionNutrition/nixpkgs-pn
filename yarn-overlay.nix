with (import <nixpkgs> {});

self: super:

# taken from nix overlay 19.09
rec {
  pname = "yarn";
  version = "1.19.0";

  src = builtins.fetchzip {
    url = "https://github.com/yarnpkg/yarn/releases/download/v${version}/yarn-v${version}.tar.gz";
    sha256 = "14h293kixxiww41daj0xyjii8d9mgr2ah5sxadass60p61ynxsq4";
  };

  # forcing node to be 11
  buildInputs = [ nodejs-11_x ];

  installPhase = ''
        mkdir -p $out/{bin,libexec/yarn/}
        cp -R . $out/libexec/yarn
        ln -s $out/libexec/yarn/bin/yarn.js $out/bin/yarn
        ln -s $out/libexec/yarn/bin/yarn.js $out/bin/yarnpkg
  '';

  meta = with builtins.stdenv.lib; {
    homepage = https://yarnpkg.com/;
    description = "Fast, reliable, and secure dependency management for javascript";
    license = licenses.bsd2;
    maintainers = with maintainers; [ offline screendriver ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
