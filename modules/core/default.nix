{ ... }:
{
  imports = [
    ./bootloader.nix
     ./hardware.nix
     ./xserver.nix
    ./network.nix
    ./bluetooth.nix
    ./fonts.nix
    ./nh.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
#    ./steam.nix
    ./system.nix
#    ./flatpak.nix
    ./user.nix
    ./wayland.nix
    ./virtualization.nix
    ./pkgs.nix
    # ./qmk.nix
  ];
}
