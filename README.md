# Nixbalamods

Declarative configuration of Balatro mods using Nix.

It's not really usable at the moment due to the number of mods available but feel free to add them to `pkgs/mods.nix`!

## Nixpkgs

Ideally this should be in nixpkgs, but I'm too lazy to make a PR. It shouldn't take long if you're familiar with the nixpkgs codebase though.

## Usage

You can test the project by writing the following flake (Balatro.exe needs to be in the same directory)

```nix
{
  inputs = {
    nixbalamods = { url = "github:marie-bnl/nixbalamods"; };
  };

  outputs = { nixbalamods, ... }:
    let
      nbmpkgs = nixbalamods.packages.x86_64-linux;
    in
    {
      packages.x86_64-linux.default = nbmpkgs.balatro.override {
        overriddenSrc = ./Balatro.exe;
        modList = with nbmpkgs.mods; [
          smods
        ];
      };
    };
}
```

And running `NIXPKGS_ALLOW_UNFREE=1 nix build path:.`

Afterwards, launching `./result/bin/balatro` should run Balatro with the mods.