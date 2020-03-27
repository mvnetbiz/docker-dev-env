# This is a file to be interpreted by the utility nix-shell, which when invoked
# in this directory will drop you into a shell with the packages in tools.nix

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = import ./tools.nix { inherit pkgs; };
}
