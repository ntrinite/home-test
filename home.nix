{ config, pkgs, ... }:

{
  # Import other nix modules
  imports = [ ./terminal ./programs ./de/gnome ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ntrinite";
  home.homeDirectory = "/home/ntrinite";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  # TODO: break out packages into their own nix file and then inherit here
  home.packages = with pkgs; [
    vim
    git

    # TODO: figure out how to put this in code/default.nix
    boost
    grpc
    grpcui
    protobuf
    nixfmt
    nil

    # TODO: add python?
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
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ntrinite/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { EDITOR = "vim"; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
