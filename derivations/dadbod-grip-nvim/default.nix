{
  vimUtils,
  fetchFromGitHub,
}:

vimUtils.buildVimPlugin {
  pname = "dadbod-grip-nvim";
  version = "unstable-2026-09-01";
  src = fetchFromGitHub {
    owner = "joryeugene";
    repo = "dadbod-grip.nvim";
    rev = "main";
    sha256 = "sha256-pVB8MI4d+og811TxTxIJkAiSDbhY+tv3GsEy7WhPFK0=";
  };
  meta.description = "Grip plugin for dadbod.nvim database connections";
  doCheck = false;
}
