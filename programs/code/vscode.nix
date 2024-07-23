{ config, pkgs, lib, ... }:

let

in {

  programs.vscode = {
    enable = true;
    # REVIST: may not do settings this way since I may want it to be more mutable from vscode
    userSettings = {
      "git.autofetch" = "all";
      "git.autofetchPeriod" = 43200;
      "files.trimTrailingWhitespace" = true;
      "files.autoSave" = "afterDelay";
      "files.insertFinalNewLine" = true;
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = true;
      "terminal.integrated.defaultProfile.linux" =
        "fish"; # might need to do pkgs.fish
      "files.associations" = {
        "*.cfg" = "json";
        "*.py" = "python";
      };
      "workbench.colorTheme" = "Baby Panda";

      # Extension specific settings
      # TODO: See if we can incorporate these with their specific extensions

      # Indent rainbow
      "indentRainbow.colors" = [
        "rgba(242,244,245,0.07)"
        "rgba(115,250,115,0.07)"
        "rgba(255,127,255,0.07)"
        "rgba(96,252,252,0.07)"
      ];
      "indentRainbow.ignoreErrorLanguages" = [ "markdown" ];

      # cmake
      "cmake.configureOnEdit" = false;

      # Set material icons
      "workbench.iconTheme" = "material-icon-theme";

      # Set up nix extension for formatting
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = { "command" = [ "${pkgs.nixfmt}/bin/nixfmt" ]; };
        };
      };
    };
    extensions = with pkgs.vscode-extensions;
      [
        # ms-python.python Frozen at checkPhase when trying to rebuild
        # ms-python.vscode-pylance
        mkhl.direnv
        oderwat.indent-rainbow
        jnoortheen.nix-ide
        ms-vscode-remote.remote-ssh
        mhutchie.git-graph
        waderyan.gitblame
        # eamodio.gitlens # Currently crashing vscode?
        ms-vscode.cpptools
        tamasfe.even-better-toml
        ms-vscode.cmake-tools
        davidanson.vscode-markdownlint
        mechatroner.rainbow-csv
        zxh404.vscode-proto3
        pkief.material-icon-theme
        gruntfuggly.todo-tree
        ms-azuretools.vscode-docker
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        { # Baby pand theme
          name = "baby-panda";
          publisher = "gsgualbano";
          version = "0.0.1";
          sha256 = "sha256-D57YJmms9w1HfSeXbCU/4LUuAbCF3/lFCysTmq+F5ss=";
        }
        { # Robot test framework lsp
          name = "robotframework-lsp";
          publisher = "robocorp";
          version = "1.11.0";
          sha256 = "sha256-DQ4cSD9ZCRlAWMaWOCjAPYHwS9T/0UAVpmLRwQxU3hE=";
        }
        { # doxygen
          name = "doxdocgen";
          publisher = "cschlosser";
          version = "1.4.0";
          sha256 = "sha256-InEfF1X7AgtsV47h8WWq5DZh6k/wxYhl2r/pLZz9JbU=";
        }
        { # Better comments
          name = "better-comments";
          publisher = "aaron-bond";
          version = "3.0.2";
          sha256 = "sha256-hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
        }
        { # vscode test adapter, needed for test explorer ui
          name = "test-adapter-converter";
          publisher = "ms-vscode";
          version = "0.1.9";
          sha256 = "sha256-M53jhAVawk2yCeSrLkWrUit3xbDc0zgCK2snbK+BaSs=";
        }
        { # test explorer ui
          name = "vscode-test-explorer";
          publisher = "hbenl";
          version = "2.21.1";
          sha256 = "sha256-fHyePd8fYPt7zPHBGiVmd8fRx+IM3/cSBCyiI/C0VAg=";
        }
        { # cmake test explorer
          name = "cmake-test-adapter";
          publisher = "fredericbonnet";
          version = "0.17.3";
          sha256 = "sha256-5D9JvpWiMXsyrpo50eoRb0+55m5vyrRn3QL/wkFpq3M=";
        }
        { # geo data viewer
          name = "geo-data-viewer";
          publisher = "RandomFractalsInc";
          version = "2.6.0";
          sha256 = "sha256-PCHqzeryp2CEyquXYCN5oVJ6ykO470vlP0NX27la2G0=";
        }
        { # qml
          name = "QML";
          publisher = "bbenoist";
          version = "1.0.0";
          sha256 = "sha256-tphnVlD5LA6Au+WDrLZkAxnMJeTCd3UTyTN1Jelditk=";
        }
      ];
  };
}
