{ config, pkgs, lib, ... }:

let

  # There is probably some sort of nix pkg for this but right now referring to https://github.com/EliverLara/terminator-themes/blob/master/themes.md
  after-dark = {
    name = "After Dark";
    background_color = "#10111b";
    cursor_color = "#aaaaaa";
    palette =
      "#2e3436:#ef4a9e:#00d2bc:#e7ca7a:#9399fa:#ca5bcc:#86d079:#d3d7cf:#555753:#ef4a9e:#00d2bc:#e7ca7a:#9399fa:#ca5bcc:#86d079:#eeeeec";
    type = "dark";
  };

in {

  programs.terminator = {
    enable = true;
    config = {
      global_config = {
      };
      profiles.default = {
        font = "Monospace Regular 12";
        use_system_font = false;
        scrollback_infinite = true;
        cursor_blink = true;
        show_titlebar = false;

        cursor_color = after-dark.cursor_color;
        background_color = after-dark.background_color;
        palette = after-dark.palette;
        background_image = "None";
        background_type = "transparent";
        background_darkness = 0.85;
      };
    };
  };
}

