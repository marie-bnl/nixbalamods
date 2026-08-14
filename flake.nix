{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    in
    {
      packages.${system} = {
        balatro = pkgs.callPackage ./pkgs/balatro.nix {};
        mods = pkgs.callPackage ./pkgs/mods.nix {};
      };
    };
}