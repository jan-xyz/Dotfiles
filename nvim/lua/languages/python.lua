local M = {}

function M.setup()
	local nvim_lsp = require("lspconfig")
	local lsp = require("lsp.config")
	local completion = require("cmp_nvim_lsp")

	local config = {
		capabilities = completion.default_capabilities(),
		on_attach = lsp.on_attach,
	}

	-- dynamically determine which interpreter to pick for the project
	local cwd = vim.loop.cwd()
	local possible_environments = {
		cwd .. "/venv/bin/python",
		cwd .. "/.venv/bin/python",
		cwd .. "/virtualenv/bin/python",
	}
	for _, environment in ipairs(possible_environments) do
		-- determine if the file is readable
		local f = io.open(environment, "r")
		if f ~= nil and io.close(f) then
			vim.notify("setting python environment for lsp to: " .. environment, vim.log.levels.DEBUG)
			config["settings"] = { pylsp = { plugins = { jedi = { environment = environment } } } }
			break
		end
	end

	nvim_lsp.pylsp.setup(config)
end

return M
