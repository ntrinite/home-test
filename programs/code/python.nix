{pkgs, python3, lib, ...}:

let
  # dted =
  # {pkgs, python3}:
  #   pkgs.python3.buildPythonPackage rec {
  #     pname = "dted";
  #     version = "1.0.4";
  #     src = pkgs.python3Packages.fetchPypi {
  #       inherit pname version;
  #       sha256 = lib.fakeSha256;
  #     };
  #   };
in
    # (pkgs.python3.withPackages (ppkgs: with ppkgs; [
    #   numpy
    #   scipy
    #   pandas
    #   paramiko
    #   pysimplegui
    #   icmplib
    #   matplotlib
    #   haversine
    #   grpcio
    #   grpcio-reflection
    #   protobuf3
    #   robotframework
    #   robotframework-sshlibrary
    #   scp
    # ]))
