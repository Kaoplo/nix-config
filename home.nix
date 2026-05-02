{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
  ];

  username = "kaoplo";
  homeDirectory = "/home/kaoplo";

  stateVersion = "23.11";
  };
}
