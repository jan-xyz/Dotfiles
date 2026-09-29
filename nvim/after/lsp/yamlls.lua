local custom_tags = {}
for _, tag in ipairs({
	"!And",
	"!If",
	"!Not",
	"!Equals",
	"!Or",
	"!FindInMap",
	"!Base64",
	"!Cidr",
	"!Ref",
	"!Sub",
	"!GetAtt",
	"!GetAZs",
	"!ImportValue",
	"!Select",
	"!Split",
	"!Join",
}) do
	for _, kind in ipairs({ "scalar", "mapping", "sequence" }) do
		table.insert(custom_tags, tag .. " " .. kind)
	end
end

return {
	settings = {
		yaml = {
			validate = true,
			format = { enable = true },
			schemas = {
				["https://raw.githubusercontent.com/lalcebo/json-schema/master/serverless/reference.json"] = "serverless.{yml,yaml}",
				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.2-standalone-strict/all.json"] = "**/*.k8s.{yml,yaml}",
			},
			customTags = custom_tags,
		},
	},
}
