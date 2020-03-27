let
  pkgs = import <nixpkgs> {};
in
with pkgs; buildEnv {
  inherit ((import <nixpkgs/nixos> {}).config.system.path)
  pathsToLink ignoreCollisions postBuild;
  extraOutputsToInstall = [ "man" ];
  name = "dev-install";
  paths = import ./tools.nix { inherit pkgs; };
}

