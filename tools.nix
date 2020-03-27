# This file defines the list of derivations/packages we want to install.
# This list is defined in one place so it may be included in the other files that
# make the various nix-shell, Docker, etc. environments that these packages will be
# integrated into. This way we have the exact same versions in a local shell
# Or in a local or remote container.

# Below is a function which takes one parameter, a set containing the Nixpkgs
# Package set, so we can use a package it already has definitions for
# (or even override its attributes like version) we return a list of these packages.

{ pkgs }:

with pkgs; [
  ansible
  bash
  coreutils
  git
  go_1_12 # Use a specific go version included in Nixpkgs already
  nano
  vim
  (terraform.overrideAttrs (oldAttrs: let
    version = "0.10.2";
    sha256 = "1q7za7jcfqv914a3ynfl7hrqbgwcahgm418kivjrac6p1q26w502";
  in {
    name = "terraform-${version}";
    src = pkgs.fetchFromGitHub {
      owner = "hashicorp";
      repo = "terraform";
      rev = "v${version}";
      inherit sha256;
    };
  }))
]
