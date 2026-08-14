# Nixbalamods

Declarative configuration of Balatro mods using Nix.

It's a demo but it's probably very broken! Some mods have trouble loading from a read-only file system that uses symlinks. And it seems like a lot assume that the configuration folder is the parent directory of `LOVELY_MOD_DIR`, which is read-only as well so all mods config probably doesn't work.

## Nixpkgs

Ideally this should be in nixpkgs, but I'm too lazy to make a PR. It shouldn't take long if you're familiar with the nixpkgs codebase though. Plus this repo is currently less than 100 lines of code.

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

## Potential additions

These are things I think would be nice to add, not that I plan to work on it though.

- **Mod dependencies**

  Many mods depend on smods for example. It would be nice to add them to the mod derivation's inputs and automatically add the inputs to the link farm. That way you wouldn't have to specify smods manually anymore.

- **Mod metadata**

  I guess this lacks descriptions, licensing, credits to mod authors... to be a proper package repository.
