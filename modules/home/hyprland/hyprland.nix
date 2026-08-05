{ pkgs, osConfig, ...}:

{
  home.packages = with pkgs; [
    waybar
    kitty
  ];	
  wayland.windowManager.hyprland = {
    enable = true;
    package = osConfig.programs.hyprland.package;
  };
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
  };
}
