local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("mark.lang.lsp.lsp-installer")
require("mark.lang.lsp.handlers").setup()
