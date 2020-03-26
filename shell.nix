{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
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
