# nix-shell / Nixpkgs dockerTools for dev environment examples

Just some quick basic examples of either a local shell or a docker container that have some tools in their environment. It would be possible to make one of the .nix files include the other or to have a common file for the inputs (go, ansible, terraform) so that changes to versions of the common tools or anything would only need to be updated in one file (that is if both of these approaches would be used anyways).

I will hopefully add an example of overriding a package version later, but If you want to maintain specific versions of these tools there are a couple of approaches - one approach would be to stick with the same git revision of the nixpkgs "channel", another is to override the version of specific packages individually, which in most cases is probably simply adding the version attribute and sha256 of whichever tool.

To use this, you can run any of:
$ nix-shell # Enter local shell
$ nix-build default.nix # Build a docker image
$ nix-build withUIDs.nix # Build a docker image. This version includes creating users with UID/GID from a JSON file.
