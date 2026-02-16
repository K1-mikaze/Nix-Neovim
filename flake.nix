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

    LSPs = with pkgs; [
      typescript-language-server
      lua-language-server
      vscode-css-languageserver
      jdt-language-server
      bash-language-server
      yaml-language-server
      nixd
      pyright
      marksman
      rust-analyzer
    ];

    formatters = with pkgs; [
      stylua
      rustfmt
      prettier
      biome
      alejandra
      black
    ];

    databaseClients = with pkgs; [
      postgresql
      mongosh
    ];

    pluginDependencies = with pkgs; [
      ripgrep
      git
      lldb
      lazygit
      manix
      jq
    ];
  in {
    packages.${system} = {
      default = pkgs.callPackage ./neovim.nix {
        configuration = pkgs.runCommandLocal "configuration" {} ''
          mkdir -p $out
          cp -r ${./configuration}/* $out
        '';
        runtimeDependencies = LSPs ++ formatters ++ databaseClients ++ pluginDependencies;
      };
    };

    apps.${system}.default = {
      type = "app";
      program = "${self.packages.${system}.default}/bin/nvim";
    };

    meta = {
      description = ''
        === My custom Neovim configuration ===
        Build:
          - nix run .
          - nix build .
          - nix develop
      '';
    };
  };
}
