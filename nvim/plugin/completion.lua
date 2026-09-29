vim.pack.add({ "https://github.com/rafamadriz/friendly-snippets" })

vim.o.autocomplete = true
vim.o.complete = "o,.^10,w^5,b^5,u^5"
vim.o.completeopt = "menuone,noselect,popup,fuzzy"
vim.o.pumheight = 15

vim.o.wildmode = "noselect:lastused,full"
vim.o.wildoptions = "pum,fuzzy"
vim.api.nvim_create_autocmd("CmdlineChanged", {
	group = vim.api.nvim_create_augroup("my.cmdline_completion", {}),
	pattern = { ":", "/", "?" },
	callback = function()
		vim.fn.wildtrigger()
	end,
})

local snippets = require("mini.snippets")
snippets.setup({
	snippets = { snippets.gen_loader.from_lang() },
})
snippets.start_lsp_server()

local function convert(item)
	local kind = vim.lsp.protocol.CompletionItemKind[item.kind] or "Unknown"
	local icon = MiniIcons.get("lsp", kind)
	return { kind = icon .. " " .. kind }
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp.completion", {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/completion", args.buf) then
			vim.lsp.completion.enable(true, client.id, args.buf, { convert = convert })
		end
	end,
})
