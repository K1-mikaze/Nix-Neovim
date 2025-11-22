# Use this if you want to run it without flakes
let
  pkgs = import <nixpkgs> {};
in
  pkgs.callPackage ./neovim.nix {}
