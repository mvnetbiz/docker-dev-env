# nix-shell / Nixpkgs dockerTools for dev environment examples

Just some quick basic examples of either a local shell or a Docker container that have some tools in their environment. `tools.nix` contains all of the packages, including two examples of different ways you might use a specific package version. Running `$ nix-shell` will source the file shell.nix, which contains a derivation for a shell environment including contents of `tools.nix`. Running `$ nix-build` contains a derivation for a Docker image that contains the contents of `tools.nix` in its $PATH and additionally has user accounts created from the file `users.json` which is evaluated at build-time of the Docker image.

To use this, you can run any of:
## Enter a local shell
```console
$ nix-shell
[nix-shell:~/src/docker-dev-env]$ go version
warning: GOPATH set to GOROOT (/nix/store/p2sxxrkp7y6dwzmgh003dc336x2vhmi5-go-1.12.17/share/go) has no effect
go version go1.12.17 linux/amd64
```
## Build, load, and run in a Docker image
```console
$ nix-build default.nix
$ docker load < result
Loaded image: docker-dev-uids:0.2
$ docker run -it docker-dev-uids:0.2 bash
bash-4.4# mkdir /tmp
bash-4.4# terraform --version
Terraform v0.10.2
bash-4.4# exit
$
```
