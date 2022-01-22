local packer = require("packer")

packer.reset()
packer.init({
	display = {
		open_fn = require("packer.util").float,
	},
})

packer.use("felipec/vim-sanegx")
