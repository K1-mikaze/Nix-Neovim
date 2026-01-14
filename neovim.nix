/*
=== NeoVim Wrapper ===
To build this package use:
- nix-build
https://ayats.org/blog/neovim-wrapper
*/
{
  lib,
  symlinkJoin,
  neovim-unwrapped,
  makeWrapper,
  runCommandLocal,
  vimPlugins,
  configuration,
  runtimeDependencies,
}: let
  packageName = "custom";

  startPlugins = [
    vimPlugins.rustaceanvim
    vimPlugins.markdown-preview-nvim
    vimPlugins.luasnip
    vimPlugins.friendly-snippets
    vimPlugins.which-key-nvim
    vimPlugins.telescope-nvim
    vimPlugins.plenary-nvim
    vimPlugins.gitsigns-nvim
    vimPlugins.nvim-treesitter.withAllGrammars
    vimPlugins.nvim-lspconfig
    vimPlugins.nvim-cmp
    vimPlugins.cmp-nvim-lsp
    vimPlugins.cmp_luasnip
    vimPlugins.cmp-path
    vimPlugins.lspkind-nvim
    vimPlugins.nvim-jdtls
    vimPlugins.catppuccin-nvim
    vimPlugins.tmux-nvim
    vimPlugins.nvim-dap
    vimPlugins.nvim-dap-ui
    vimPlugins.conform-nvim
    vimPlugins.nvim-lint
    vimPlugins.vim-dadbod-ui
    vimPlugins.vim-dadbod
    vimPlugins.lazygit-nvim
    vimPlugins.neo-tree-nvim
    configuration
  ];

  foldPlugins = builtins.foldl' (
    acc: next:
      acc
      ++ [
        next
      ]
      ++ (foldPlugins (next.dependencies or []))
  ) [];

  startPluginsWithDeps = lib.unique (foldPlugins startPlugins);

  packpath = runCommandLocal "packpath" {} ''
    mkdir -p $out/pack/${packageName}/{start,opt}

    ${
      lib.concatMapStringsSep
      "\n"
      (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}")
      startPluginsWithDeps
    }
  '';
in
  symlinkJoin {
    name = "neovim-custom";
    paths = [neovim-unwrapped];
    nativeBuildInputs = [makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/nvim \
        --add-flags '-u NORC' \
        --add-flags '--cmd' \
        --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
        --set-default NVIM_APPNAME nvim-custom \
        --prefix PATH : ${lib.makeBinPath runtimeDependencies}
    '';
  }
