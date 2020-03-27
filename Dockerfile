
FROM nixos/nix

RUN nix-channel --add https://nixos.org/channels/nixpkgs nixpkgs
RUN nix-channel --update

RUN \
  mkdir toolChain \
  cd toolChain \
  wget https://github.com/mvnetbiz/docker-dev-env/archive/master.zip \
  unzip master.zip \
  cd docker-dev-env-master \
  nix-env -i -f devInstall.nix \

