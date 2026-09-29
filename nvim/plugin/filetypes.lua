local function has_template_syntax(bufnr)
	for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, 50, false)) do
		if line:find("{{.-}}") then
			return true
		end
	end
	return false
end

local function yaml_or_gotmpl(_, bufnr)
	return has_template_syntax(bufnr) and "gotmpl" or "yaml"
end

local function detect_gotmpl(_, bufnr)
	if has_template_syntax(bufnr) then
		return "gotmpl"
	end
end

vim.filetype.add({
	extension = {
		dk = "dockerfile",
		gotmpl = "gotmpl",
		tmpl = detect_gotmpl,
		yaml = yaml_or_gotmpl,
		yml = yaml_or_gotmpl,
	},
	pattern = {
		[".*/playbooks/.*%.ya?ml"] = { "yaml.ansible", { priority = 10 } },
		[".*/.*playbook.*%.ya?ml"] = { "yaml.ansible", { priority = 10 } },
		[".*/roles/.*/tasks/.*%.ya?ml"] = { "yaml.ansible", { priority = 10 } },
		[".*/roles/.*/handlers/.*%.ya?ml"] = { "yaml.ansible", { priority = 10 } },
		[".*/roles/.*/tests/.*%.ya?ml"] = { "yaml.ansible", { priority = 10 } },
		[".*%.ansible%.ya?ml"] = { "yaml.ansible", { priority = 10 } },
		["site%.ya?ml"] = { "yaml.ansible", { priority = 10 } },
	},
})
