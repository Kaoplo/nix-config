{ lib, ...}:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
