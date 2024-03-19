vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"*/playbooks/*.{yaml,yml}",
		"*/*playbook*.{yaml,yml}",
		"*/roles/*/tasks/*.{yaml,yml}",
		"*/roles/*/handlers/*.{yaml,yml}",
		"*/roles/*/tests/*.{yaml,yml}",
		"*/*.ansible.{yaml,yml}",
		"site.{yaml,yml}",
	},
	callback = function()
		vim.bo.filetype = "yaml.ansible"
	end,
})
