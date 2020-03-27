let
  pkgs = import <nixpkgs> {};
in
with pkgs; buildEnv {
  extraOutputsToInstall = [ "man" ];
  name = "dev-install";
  paths = import ./tools.nix { inherit pkgs; };
}

