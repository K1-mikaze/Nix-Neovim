# Neovim-Nix

## without flakes 

```nix
```nix
nix run .
nix develop
nix build .
```


## Without flakes 

Remove the input of the file neovim.nix called configuration and add the function the lines below
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
