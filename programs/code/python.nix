# TODO: change this to an overlay structure and handle the error collisons
{ pkgs, ... }:

let
  python = pkgs.python311;
  python_pkgs = pkgs.python311Packages;


  dted = python_pkgs.buildPythonPackage rec {
    pname = "dted";
    version = "1.1.0";
    src = python_pkgs.fetchPypi {
      inherit pname version;
      sha256 = "sha256-Sa9MY03ku4r6z/us9eJNBCD7UU/6W82Oqv6BqfY1O/k=";
    };
  };

  grpc-requests = python_pkgs.buildPythonPackage rec {
    pname = "grpc_requests";
    version = "0.1.20";
    src = python_pkgs.fetchPypi {
      inherit pname version;
      sha256 =
      "sha256-p2dE14HFp786vejcd40kxOF96znRc9hQlv88ruPRUlA=";
    };
    patchPhase = "touch requirements.txt ";
    propagatedBuildInputs =
      [ python_pkgs.grpcio python_pkgs.grpcio-reflection ];
    doCheck = false;
  };

in
python.withPackages (
  ppkgs: with ppkgs; [
    numpy
    scipy
    pandas
    matplotlib
    pyside6
    grpcio
    grpcio-tools
    grpcio-reflection
    grpc-requests
    pylint # linting

    # ML libraries/utilities
    opencv4
    tensorflow-bin
    pytorch
    scikit-learn

    # Needed for robot tests
    icmplib
    paramiko
    robotframework
    robotframework-sshlibrary
    scp

    requests # HTTP library
    setuptools # setup.py

    # Random library for really only one script I've ever used
    haversine
    dted
  ]
)
