vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*" },
	callback = function()
		-- ignore lua files to not be self-detecting the pattern.
		if vim.bo.filetype == "lua" then return end

		if vim.fn.search("{{ .\\+ }}", "nw") ~= 0 then
			vim.bo.filetype = "gotmpl"
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "go.sum" },
	callback = function()
		vim.bo.filetype = "gosum"
	end,
})

-- remove the autocommands for modsim3, and lprolog files so that their
-- highlight groups, syntax, etc. will not be loaded. *.MOD is included, so
-- that on case insensitive file systems the module2 autocmds will not be
-- executed.
local oldModAu = vim.api.nvim_get_autocmds({ pattern = { "*.mod", "*.MOD" } })
for _, value in ipairs(oldModAu) do
	vim.api.nvim_del_autocmd(value.id)
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "go.mod" },
	callback = function()
		vim.bo.filetype = "gomod"
	end,
})
