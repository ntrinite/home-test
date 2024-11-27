{ config, pkgs, lib, unhinged-nix, ... }:

let
  base-extensions = with unhinged-nix.vscode-extensions; [
    ms-vscode.cpptools
  ];

in {

  programs.vscode = {
    enable = true;
    package = unhinged-nix.vscode;
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
          "formatting" = {
            "command" = [ "${unhinged-nix.nixfmt-rfc-style}/bin/nixfmt" ];
          };
        };
      };
    };
    extensions = with unhinged-nix.vscode-marketplace; [
      ms-python.python
      ms-python.vscode-pylance
      mkhl.direnv
      oderwat.indent-rainbow
      jnoortheen.nix-ide
      ms-vscode-remote.remote-ssh
      mhutchie.git-graph
      waderyan.gitblame
      eamodio.gitlens
      tamasfe.even-better-toml
      ms-vscode.cmake-tools
      davidanson.vscode-markdownlint
      mechatroner.rainbow-csv
      zxh404.vscode-proto3
      pkief.material-icon-theme
      gruntfuggly.todo-tree
      ms-azuretools.vscode-docker
      gsgualbano.baby-panda
      robocorp.robotframework-lsp
      cschlosser.doxdocgen
      aaron-bond.better-comments
      ms-vscode.test-adapter-converter
      hbenl.vscode-test-explorer
      fredericbonnet.cmake-test-adapter
      randomfractalsinc.geo-data-viewer
      bbenoist.qml
    ] ++ base-extensions; 
  };
}
