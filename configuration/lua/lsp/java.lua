
 -- LOMBOK_JAR = "${pkgs.lombok}/share/java/lombok.jar"; example of environment variable with nix
local cmd = { "jdtls" }
if vim.env.LOMBOK_JAR then
  table.insert(cmd, "--jvm-arg=-javaagent:" .. vim.env.LOMBOK_JAR)
end

vim.lsp.config("jdtls", {
	cmd = cmd,
	filetypes = { "java" },
})

vim.lsp.enable("jdtls")
