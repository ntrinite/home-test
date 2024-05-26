{ config, pkgs, ...}:

let

# TODO: slap this in another file so it's central for other shells
aliases = {
  cdgit = "cd ~/git";
  gs = "git status";
  la = "ls -a";
  ll = "ls -l";
  lla = "ls -la";
  hmsf = "home-manager switch --flake ~/home";
  hm-gens = "home-manager generations";
  vimhome = "vim ~/home/home.nix";
  home = "cd ~/home";
};

in
{

programs.fish = {
    enable = true;
    shellAliases = aliases;
    plugins = [
      { # Makes fish work better in nix environments
        name = "nix.fish";
        src = pkgs.fetchFromGitHub {
          owner = "kidonng";
          repo = "nix.fish";
          rev = "ad57d970841ae4a24521b5b1a68121cf385ba71e";
          hash = "sha256-GMV0GyORJ8Tt2S9wTCo2lkkLtetYv0rc19aA5KJbo48=";
        };
      }
    ];
  };
}


