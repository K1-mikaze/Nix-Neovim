# Neovim-Nix

set as default nvim using **nix profile install .***

## With flakes 

```nix
```nix
nix run .
nix develop
nix build .


## Without flakes 

```nix
To build it use `nix-build .` 
``` 

Remove the input of the file neovim.nix called configuration and replace the function the lines below inside the neovim.nix file
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
```
