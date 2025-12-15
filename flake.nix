{
  description = "My Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system} = {
      default = pkgs.callPackage ./neovim.nix {
        configuration = pkgs.runCommandLocal "configuration" {} ''
          mkdir -p $out
          cp -r ${./configuration}/* $out
        '';
      };
    };

    apps.${system} = {
      default = {
        type = "app";
        program = "${self.packages.${system}.default}/bin/nvim";
      };
    };

    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        self.packages.${system}.default
        pkgs.lua-language-server
        pkgs.nixd
        pkgs.alejandra
      ];
    };

    meta = {
      description = ''
        === My custom Neovim configuration ===
        Build:
          - nix run .
          - nix build .
          - nix develop
      '';
      # license = pkgs.lib.licenses.mit;  # Optional: add license
      # maintainers = [ /* your info */ ]; # Optional: add maintainers
    };
  };
}
