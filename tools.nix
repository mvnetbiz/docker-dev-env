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
