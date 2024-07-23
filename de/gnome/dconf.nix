# Used to customize some GNOME settings. Based on https://github.com/ElSargo/nix-files/blob/Flake/home/dconf.nix
# Use gsettings list-recursively | grep keybindings to get all keybinding names
{ pkgs, lib, ... }: {
  dconf.settings = with builtins;
    with lib;
    let
      binds = [{
        binding = "<Super>R";
        command = "${pkgs.rofi}/bin/rofi -show drun";
        name = "rofi";
      }];
      mkreg = imap (i: v:
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${
          toString (i - 1)
        }/");
      mkbinds = binds:
        foldl' (a: b: a // b) { } (imap (i: v: {
          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${
            toString (i - 1)
          }" = v;
        }) binds);
    in (mkbinds binds) // {

      "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings =
        mkreg binds;
      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Alt>F4" ];
        activate-window-menu = [ "<Alt>space" ];
        always-on-top = [ "<Alt><space>T" ];

        maximize = [ "<Super>Up" ];
        unmaximize = [ "<Super>Down" "<Alt>F5" ];

        move-to-side-e = [ "<Alt><Super>Right" ];
        move-to-side-n = [ "<Alt><Super>Up" ];
        move-to-side-s = [ "<Alt><Super>Down" ];
        move-to-side-w = [ "<Alt><Super>Left" ];

        move-to-corner-ne = [ "<Alt><Super><Up>Right" ];
        move-to-corner-nw = [ "<Alt><Super><Up>Left" ];
        move-to-corner-se = [ "<Alt><Super><Down>Right" ];
        move-to-corner-sw = [ "<Alt><Super><Down>Left" ];

        move-to-center = [ ];

        move-to-monitor-down = [ "<Super><Shift>Down" ];
        move-to-monitor-left = [ "<Super><Shift>Left" ];
        move-to-monitor-right = [ "<Super><Shift>Right" ];
        move-to-monitor-up = [ "<Super><Shift>Up" ];

        switch-to-workspace-last = [ "<Control><Super>End" ];
        switch-to-workspace-left = [ "<Control><Super>Left" ];
        switch-to-workspace-right = [ "<Control><Super>Right" ];
        switch-to-workspace-up = [ "<Control><Super>Up" ];
        switch-to-workspace-down = [ "<Control><Super>Down" ];

        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        switch-to-workspace-5 = [ "<Super>5" ];
        switch-to-workspace-6 = [ "<Super>6" ];
        switch-to-workspace-7 = [ "<Super>7" ];
        switch-to-workspace-8 = [ "<Super>8" ];
        switch-to-workspace-9 = [ "<Super>9" ];
        switch-to-workspace-10 = [ "<Super>0" ];
        switch-to-workspace-11 = [ ];
        switch-to-workspace-12 = [ ];

        move-to-workspace-1 = [ "<Shift><Super>1" ];
        move-to-workspace-2 = [ "<Shift><Super>2" ];
        move-to-workspace-3 = [ "<Shift><Super>3" ];
        move-to-workspace-4 = [ "<Shift><Super>4" ];
        move-to-workspace-5 = [ "<Shift><Super>5" ];
        move-to-workspace-6 = [ "<Shift><Super>6" ];
        move-to-workspace-7 = [ "<Shift><Super>7" ];
        move-to-workspace-8 = [ "<Shift><Super>8" ];
        move-to-workspace-9 = [ "<Shift><Super>9" ];
        move-to-workspace-10 = [ "<Shift><Super>10" ];

        move-to-workspace-last = [ "<Control><Shift><Alt>End" ];
        move-to-workspace-left = [ "<Control><Shift><Alt>Left" ];
        move-to-workspace-right = [ "<Control><Shift><Alt>Right" ];
        move-to-workspace-up = [ "<Control><Shift><Alt>Up" ];
        move-to-workspace-down = [ "<Control><Shift><Alt>Down" ];

        switch-applications = [ "<Super>Tab" ];
        switch-applications-backward = [ "<Super><Shift>Tab" ];
        switch-windows = [ "<Alt>Tab" ];
        switch-windows-backward = [ "<Alt><Shift>Tab" ];

        show-desktop = [ "<Primary><Super>d" "<Primary><Alt>d" "<Super>d" ];

        toggle-fullscreen = [ "F11" ];

        # Defaults I didn't care about
        toggle-maximized = [ "<Alt>F10" ];
        toggle-above = [ ];
        toggle-on-all-workspaces = [ ];
        toggle-shaded = [ ];
        begin-move = [ "<Alt>F7" ];
        begin-resize = [ "<Alt>F8" ];
        cycle-group = [ "<Alt>F6" ];
        cycle-group-backward = [ "<Shift><Alt>F6" ];
        cycle-panels = [ "<Control><Alt>Escape" ];
        cycle-panels-backward = [ "<Shift><Control><Alt>Escape" ];
        cycle-windows = [ "<Alt>Escape" ];
        cycle-windows-backward = [ "<Shift><Alt>Escape" ];
        lower = [ ];
        maximize-horizontally = [ ];
        maximize-vertically = [ ];
        minimize = [ "<Super>h" ];
        panel-main-menu = [ "<Alt>F1" ];
        panel-run-dialog = [ "<Alt>F2" ];
        raise = [ ];
        raise-or-lower = [ ];
        set-spew-mark = [ ];
        switch-group = [ "<Super>Above_Tab" "<Alt>Above_Tab" ];
        switch-group-backward =
          [ "<Shift><Super>Above_Tab" "<Shift><Alt>Above_Tab" ];
        switch-input-source = [ "<Super>space" "XF86Keyboard" ];
        switch-input-source-backward =
          [ "<Shift><Super>space" "<Shift>XF86Keyboard" ];
        switch-panels = [ "<Control><Alt>Tab" ];
        switch-panels-backward = [ "<Shift><Control><Alt>Tab" ];
      };

      # "org/gnome/shell/keybindings" = {
      #   switch-to-application-1 = [ ];
      #   switch-to-application-2 = [ ];
      #   switch-to-application-3 = [ ];
      #   switch-to-application-4 = [ ];
      #   switch-to-application-5 = [ ];
      #   switch-to-application-6 = [ ];
      #   switch-to-application-7 = [ ];
      #   switch-to-application-8 = [ ];
      #   switch-to-application-9 = [ ];
      #   switch-to-application-10 = [ ];
      # };

    };
}
