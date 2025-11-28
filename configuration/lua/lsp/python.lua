local dap = require("dap")

vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
})

vim.lsp.enable('pyright')

dap.adapters.python = {  
  type = 'executable',  
  command = 'python', 
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = 'Launch file';
    program = '${file}';
    pythonPath = function ()
      return 'python'
    end;
 },
  {
    type = 'python';
    request = 'attach';
    name = 'Attach remote';
    connect  = {
      host = '127.0.0.1';
      port = 5678;
    };

    pathMappings =  {
      {
        localRoot = '${workspaceFolder}';
        remoteRoot = '.';
      };
    };
  },
}

