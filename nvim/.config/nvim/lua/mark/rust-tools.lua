local rust_ok, rt = pcall(require, "rust-tools")
if not rust_ok then
	return
end

rt.setup({
	server = {
		on_attach = function(client, bufnr)

			require("mark.lsp.handlers").LspKeymaps(bufnr)
			require("mark.lsp.handlers").LspHighlightDocument(client)
		end,
	},
})
