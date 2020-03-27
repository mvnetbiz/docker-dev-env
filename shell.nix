{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = import ./tools.nix { inherit pkgs; };
}
