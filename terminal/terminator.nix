{ config, pkgs, lib, ... }:

let

in {

  programs.terminator = {
    enable = true;
    config = {
      profiles.default = {
        font = "Monospace Regular 12";
        use_system_font = false;
        scrollback_infinite = true;
      };
    };
  };
}

