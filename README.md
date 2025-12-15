# Nix-Wrapped Neovim Configuration

A custom Neovim configuration wrapped with Nix for easy installation and management.

## Prerequisites

- [Nix](https://nixos.org/download.html) installed on your system
- Flakes enabled (add `experimental-features = nix-command flakes` to `~/.config/nix/nix.conf` or `/etc/nix/nix.conf`)

## Installation

### Via Nix Profile (Recommended)

Install to your user profile:
```bash
nix profile install github:K1-mikaze/Nix-Neovim
nix profile install . # After downloading the repository
```

### As a Flake App

Test without installing:
```bash
nix run github:K1-mikaze/Nix-NeoVim
nix run . # After downloading the repository
```

Build the package:
```bash
nix build github:K1-mikaze/Nix-NeoVim
nix build .
```

### Home Manager Integration

Add to your Home Manager configuration:
```nix
{ inputs, ... }: {
  imports = [ inputs.neovim.homeManagerModules.default ];
  programs.neovim.enable = true;
}
```

### NixOS Module

Add to your NixOS configuration:
```nix
{ inputs, ... }: {
  imports = [ inputs.neovim.nixosModules.default ];
  environment.systemPackages = [ inputs.neovim.packages.${pkgs.system}.default ];
}
```

## Usage

After installation, run Neovim with:
```bash
nvim
```

For development (includes language servers and formatters):
```bash
nix develop
```

## Without Flakes

To build without flakes:
```bash
nix-build .
```

## Customization

To modify the Neovim configuration, edit files in the `configuration/` directory. For Nix-specific changes, update `neovim.nix` or `flake.nix`.

If using without flakes, remove the `configuration` input from `neovim.nix` and replace with:
```nix
neovim.nix
{
  lib,
  stdenv,
  symlinkJoin,
  neovim-unwrapped,
  makeWrapper,
  runCommandLocal,
  vimPlugins,
}: let
  packageName = "custom";

  configuration = runCommandLocal "configuration" {} ''
    mkdir -p $out
    cp -r ${./configuration}/* $out/
  '';
``` 
