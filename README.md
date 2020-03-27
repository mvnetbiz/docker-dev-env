# nix-shell / Nixpkgs dockerTools for dev environment examples

Just some quick basic examples of either a local shell or a Docker container that have some tools in their environment. `tools.nix` contains all of the packages, including two examples of different ways you might use a specific package version. Running `$ nix-shell` will source the file shell.nix, which contains a derivation for a shell environment including contents of `tools.nix`. Running `$ nix-build` contains a derivation for a Docker image that contains the contents of `tools.nix` in its $PATH and additionally has user accounts created from the file `users.json` which is evaluated at build-time of the Docker image.

To use this, you can run any of:
## Enter a local shell
```console
$ # In this repository:
$ nix-shell
[nix-shell:~/src/docker-dev-env]$ go version
warning: GOPATH set to GOROOT (/nix/store/p2sxxrkp7y6dwzmgh003dc336x2vhmi5-go-1.12.17/share/go) has no effect
go version go1.12.17 linux/amd64
```
## Build, load, and test a tool in the Docker image
```console
$ # In this repository:
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

## Other considerations
The above options are one step to build, automatically reproducible, and easy to version and garbage collect. Nixpkgs' dockerTools.buildImage is different than Docker build because it builds all the the packages on the host and then combines them together in an image following the Docker format. The benefit of this is that it is built sandboxed and with deterministic inputs, as opposed to common Dockerfile implementations that introduce impurities like direct internet access to retrieve sources, possibly introducing non-determinism.

Another option that might be easier to integrate into an existing CI/CD could be to use a Docker container that actually contains the whole Nix tools inside of it. Your pipeline would fetch your Nix expressions in this container and build the environment. This could be cached somewhere or your package build could be done in the same step. [Official Nix package manager Docker image](https://hub.docker.com/r/nixos/nix/) 

## Dockerfile implementation of the latter idea.
```console
$ # In this repository:
$ docker build -t my-nix-toolchain .
Sending build context to Docker daemon  117.2kB
...
Successfully built 9b47447b746b
Successfully tagged my-nix-toolchain:latest
$ docker run -it my-nix-toolchain:latest go version
go version go1.12.17 linux/amd64
```

## More Info
- More examples: <https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/docker/examples.nix>
- Article with more in-depth examples for Nixpkgs dockerTools: <http://lethalman.blogspot.com/2016/04/cheap-docker-images-with-nix_15.html>
