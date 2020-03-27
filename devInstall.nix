# This defines a sort of "meta-package" that defines one attribute that we can
# persistently install into our environment that will bring everything to our path

let
  pkgs = import <nixpkgs> {};
in
with pkgs; buildEnv {
  extraOutputsToInstall = [ "man" ];
  name = "dev-install";
  paths = import ./tools.nix { inherit pkgs; };
}

