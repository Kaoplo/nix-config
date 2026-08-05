{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
# basic stuff
      "$mod, F1, exec, show-keybinds"

      "$mod SHIFT, Return, exec, kitty"
      "$mod, f, exec, firefox"
      ",PtrScr, exec, flameshot gui"
      "$mod, Q, killactive,"
      "ALT ,Return, fullscreen, 1"
      "$mod, Space, exec, toggle-float"
      "$mod, A, exec, rofi -show drun"
      "$mod, Escape, exec, hyprlock"
      "$mod, Backspace, exec, power-menu"
      "$mod, SHIFT Q, exit"


      # focus switch
      "$mod, H, movefocus, l"
      "$mod, J, movefocus, d"
      "$mod, K, movefocus, u"
      "$mod, L, movefocus, r"

      # workspace switch
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"

      "$mod SHIFT, h, resizeactive, -80 0"
      "$mod SHIFT, j, resizeactive, 0 80"
      "$mod SHIFT, k, resizeactive, 0 -80"
      "$mod SHIFT, l, resizeactive, 80 0"

      "$mod ALT, h, swapwindow, l"
      "$mod ALT, j, swapwindow, u"
      "$mod ALT, k, swapwindow, d"
      "$mod ALT, l, swapwindow, r"

      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioStop, exec, playerctl stop"
    ];
      bindl = [ ",switch:on:Lid Switch, exec, pidof hyprlock || hyprlock"];
  };
}
