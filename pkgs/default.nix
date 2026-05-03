# Nixpkgs overlay: adds custom packages under `pkgs.*`
final: prev: {
  pokego = final.callPackage ./pokego.nix { };
}
