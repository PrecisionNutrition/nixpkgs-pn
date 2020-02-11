# nixpkgs-pn

## Development

to update a package version, i.e. yarn
you will need to change the version number and recalculate the sha

```
nix-prefetch-url --unpack https://github.com/NixOS/nix/archive/1f795f9f44607cc5bec70d1300150bfefcef2aae.tar.gz
```

## Releasing

* merge pull request
* tag a new version of master
* push tags
* change tag version on applications using `nixpkgs-pn`
