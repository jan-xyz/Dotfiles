local venv_dirs = { "venv", ".venv", "env", ".env", "virtualenv", ".virtualenv" }

return {
	before_init = function(_, config)
		local root = config.root_dir or vim.uv.cwd()
		for _, dir in ipairs(venv_dirs) do
			local python = vim.fs.joinpath(root, dir, "bin", "python")
			if vim.uv.fs_stat(python) then
				config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
					pylsp = {
						plugins = {
							jedi = { environment = python },
							pylsp_mypy = { overrides = { "--python-executable", python, true } },
						},
					},
				})
				return
			end
		end
	end,
}
