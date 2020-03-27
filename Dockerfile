
FROM nixos/nix

RUN nix-channel --add https://nixos.org/channels/nixos-20.03 nixpkgs
RUN nix-channel --update

RUN \
  mkdir toolchain && \
  cd toolchain && \
  wget https://github.com/mvnetbiz/docker-dev-env/archive/master.zip && \
  unzip master.zip && \
  cd docker-dev-env-master && \
  nix-env -i -f devInstall.nix

