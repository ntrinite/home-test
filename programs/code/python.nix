# TODO: change this to an overlay structure and handle the error collisons
{ pkgs, lib, ... }:

let
  python = pkgs.python311;

  # dted = python.pkgs.buildPythonPackage rec {
  #   pname = "dted";
  #   version = "1.1.0";
  #   src = python_pkgs.fetchPypi {
  #     inherit pname version;
  #     sha256 = "sha256-Sa9MY03ku4r6z/us9eJNBCD7UU/6W82Oqv6BqfY1O/k=";
  #   };
  # };

  # grpcio-reflection = python.pkgs.buildPythonPackage rec {
  #   pname = "grpcio-reflection";
  #   version = python_pkgs.grpcio.version;
  #   src = python_pkgs.fetchPypi {
  #     inherit pname version;
  #     sha256 = "sha256-iSXeqHqESALgRjhJgJ1j3Q/KLFj+wPZIilljaDT1WkY=";
  #   };
  #   propagatedBuildInputs = [ python python_pkgs.grpcio ];
  #   doCheck = false;

  # };

  # grpc-requests = python.pkgs.buildPythonPackage rec {
  #   pname = "grpc_requests";
  #   version = "0.1.10";
  #   src = python_pkgs.fetchPypi {
  #     inherit pname version;
  #     sha256 =
  #     "sha256-+eIWpGGRZhxHitcrqnl855wrHciKD7MQTDPgBUAmLbA=";
  #   };
  #   patchPhase = "touch requirements.txt ";
  #   propagatedBuildInputs =
  #     [ pkgs.python3Packages.grpcio python.pkgs.python3Packages.grpcio-reflection ];
  #   doCheck = false;
  # };

in python.withPackages (ppkgs:
  with ppkgs; [
    numpy
    scipy
    pandas
    matplotlib
    pysimplegui
    pyside6
    grpcio
    grpcio-tools
    grpcio-reflection
    # grpc-requests
    pylint # linting

    # ML libraries/utilities
    # opencv4
    # tensorflow
    # pytorch
    # scikit-learn

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
    dted #FIX: isn't being recognized?
  ])
