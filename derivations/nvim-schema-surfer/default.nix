{ vimUtils, fetchFromGitHub, cargo, rustc }:

vimUtils.buildVimPlugin {
  pname = "nvim-schema-surfer";
  version = "unstable-2026-09-01";

  src = fetchFromGitHub {
    owner = "mrqwer";
    repo = "nvim-schema-surfer";
    rev = "main";
    sha256 = "sha256-9lBlg+AxpddjX+xdzd9gSgVzlRgxvqi3ewSm8CDTNgQ=";
  };

  doCheck = false;

  buildInputs = [ cargo rustc ];

  meta.description = "Neovim plugin for browsing and searching database schemas";
}