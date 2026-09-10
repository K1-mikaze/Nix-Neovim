{
  vimUtils,
  fetchFromGitHub,
}:

vimUtils.buildVimPlugin {
  pname = "pi-nvim";
  version = "v0.2.5";
  src = fetchFromGitHub {
    owner = "carderne";
    repo = "pi-nvim";
    rev = "main";
    sha256 = "sha256-KGUPVXA/a+nTElSxcjngH9Ij/tttDQ48NrYTVg+FSXk=";
  };
  meta.description = "Bridge between pi coding agent and Neovim";
}
