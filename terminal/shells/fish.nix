{ config, pkgs, ...}:

let

# TODO: slap this in another file so it's central for other shells
aliases = {
  cdgit = "cd ~/git";
  gs = "git status";
  la = "ls -a";
  ll = "ls -l";
  lla = "ls -la";
  hmsf = "home-manager switch --flake ~/.flakes -v";
  hm-gens = "home-manager generations";
  vimhome = "vim ~/.flakes/home.nix";
  home = "cd ~/.flakes";
};

abbrv = {
  gc = "git commit -m \"";
  gp = "git push";
};

in
{

programs.fish = {
    enable = true;
    shellAliases = aliases;
    shellAbbrs = abbrv;
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


