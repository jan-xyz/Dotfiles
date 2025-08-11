vim.bo.tabstop = 4
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

local config = {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

-- dynamically determine which interpreter to pick for the project
local cwd = vim.loop.cwd()
local possible_environments = {
	cwd .. "/venv/bin/python",
	cwd .. "/.venv/bin/python",
	cwd .. "/env/bin/python",
	cwd .. "/.env/bin/python",
	cwd .. "/virtualenv/bin/python",
	cwd .. "/.virtualenv/bin/python",
}
for _, environment in ipairs(possible_environments) do
	-- determine if the file is readable
	local f = io.open(environment, "r")
	if f ~= nil and io.close(f) then
		vim.notify("setting python environment for lsp to: " .. environment, vim.log.levels.DEBUG)
		config["settings"] = {
			pylsp = {
				plugins = {
					jedi = { environment = environment },
					pylsp_mypy = { overrides = { "--python-executable", environment, true } },
				},
			},
		}
		break
	end
end
vim.lsp.config("pylsp", config)
vim.lsp.enable("pylsp")
