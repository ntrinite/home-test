{ config, pkgs, ... }:

{
  # Import other nix modules
  imports = [ ./terminal ./programs ./de/gnome ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ntrinite";
  home.homeDirectory = "/home/ntrinite";
  home.stateVersion = "23.11";

  # The home.packages option allows you to install Nix packages into your
  # environment.

  # TODO: break out packages into their own nix file and then inherit here
  home.packages = with pkgs; [
    vim
    git
  ];

  # Adds application icons to app selector
  xdg = {
    enable = true;
    systemDirs.data = [
      "/usr/share/ubuntu"
      "/usr/local/share/"
      "/usr/share/"
      "/var/lib/snapd/desktop"
    ];
  };
  # TODO: make this an option from flake to switch between NixOS or just Ubuntu
  targets.genericLinux = { enable = true; };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };
  home.sessionVariables = { EDITOR = "vim"; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
