let
  pkgs = import <nixpkgs> {};
  dockerTools = pkgs.dockerTools;
  users = with builtins; fromJSON (readFile ./users.json);
  addUsers = with pkgs.lib; concatMapStringsSep "\n"
    ({user, uid, gid}: ''
        groupadd -r -g ${gid} "${user}"
        useradd "${user}" -u ${uid} -g ${gid}
    '') users;
in
dockerTools.buildImage {
  name = "docker-dev-uids";
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

  runAsRoot = ''
    #!${pkgs.stdenv.shell}
    ${dockerTools.shadowSetup}
    ${addUsers}
  '';
}
