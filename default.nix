let
  pkgs = import <nixpkgs> {};
  dockerTools = pkgs.dockerTools;
in
dockerTools.buildImage {
  name = "docker-dev-env";
  tag = "0.1";
  contents = with pkgs; [
    coreutils
    bash
    vim
    nano
    git
    go
    terraform
    ansible
  ];
}
