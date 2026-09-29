vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/kosayoda/nvim-lightbulb",
})

require("nvim-lightbulb").setup({ sign = { text = "" }, autocmd = { enabled = true } })

vim.lsp.enable({
	"bashls",
	"buf_ls",
	"ccls",
	"codebook",
	"dartls",
	"docker_language_server",
	"emmylua_ls",
	"fish_lsp",
	"gopls",
	"hls",
	"jsonnet_ls",
	"kotlin_lsp",
	"metals",
	"pylsp",
	"remark_ls",
	"rust_analyzer",
	"sourcekit",
	"stylua",
	"ts_ls",
	"vimls",
	"yamlls",
})

vim.lsp.inlay_hint.enable(true)

local function organize_imports(client, bufnr)
	local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
	params.context = { only = { "source.organizeImports" }, diagnostics = {} }
	local response = client:request_sync("textDocument/codeAction", params, 1000, bufnr)
	for _, action in ipairs(response and response.result or {}) do
		if action.edit then
			vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
		end
	end
end

local function format_on_save(client, bufnr)
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = vim.api.nvim_create_augroup("my.lsp.fmt." .. client.name .. "." .. bufnr, { clear = true }),
		buffer = bufnr,
		callback = function()
			if vim.g.autoformat == false then
				return
			end
			if client.name == "gopls" then
				organize_imports(client, bufnr)
			end
			vim.lsp.buf.format({ bufnr = bufnr, id = client.id, async = false })
		end,
	})
end

local function on_attach(args)
	local bufnr = args.buf
	local client = vim.lsp.get_client_by_id(args.data.client_id)
	if not client then
		return
	end

	local function map(lhs, rhs, desc)
		vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
	end

	map("<leader>d", vim.diagnostic.setloclist, "Open buffer diagnostics")
	map("<leader>D", vim.diagnostic.setqflist, "Open workspace diagnostics")

	if client:supports_method("textDocument/codeLens", bufnr) then
		vim.lsp.codelens.enable(true, { bufnr = bufnr })
		map("<leader>c", vim.lsp.codelens.run, "Perform codelens")
	end

	if client:supports_method("workspace/symbol", bufnr) then
		map("<leader>O", vim.lsp.buf.workspace_symbol, "Open workspace symbol picker")
	end

	if client:supports_method("textDocument/formatting", bufnr) then
		format_on_save(client, bufnr)
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = on_attach,
})
