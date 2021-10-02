# nixpkgs-pn

## updating nixpkgs

```nix
nix-shell -p niv
niv update
```

If you need to change nix version update the branch in `sources.json`

## Development

To update a package version, i.e. yarn
you will need to change the version number and recalculate the sha

```
nix-prefetch-url --unpack https://github.com/NixOS/nix/archive/1f795f9f44607cc5bec70d1300150bfefcef2aae.tar.gz
```

## Releasing

* Merge pull request
* Tag a new version of master
* Push tags
* Change tag version on applications using `nixpkgs-pn`
