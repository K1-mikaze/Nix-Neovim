local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Common capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true


local config = {
  capabilities = capabilities,
  cmd = { 'dart', 'language-server', '--protocol=lsp' },
  filetypes = { 'dart' },
  root_dir = require('lspconfig.util').root_pattern('pubspec.yaml', '.git'),
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    outline = true,
    onlyAnalyzeProjectsWithOpenFiles = false,
    suggestFromUnimportedLibraries = true,
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    }
  },
}

lspconfig.dartls.setup(config)
