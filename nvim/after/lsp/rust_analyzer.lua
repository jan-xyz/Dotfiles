return {
	-- the rustup shim earlier on PATH does not always ship rust-analyzer
	cmd = { "/opt/homebrew/bin/rust-analyzer" },
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
			check = { command = "clippy" },
			diagnostics = {
				enable = true,
				experimental = { enable = true },
			},
		},
	},
}
