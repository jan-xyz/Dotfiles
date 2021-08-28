local packer = require("packer")

-- Debugger
packer.use("mfussenegger/nvim-dap")
packer.use({ "theHamsta/nvim-dap-virtual-text", requires = { "mfussenegger/nvim-dap" } })
packer.use({ "nvim-telescope/telescope-dap.nvim", requires = "mfussenegger/nvim-dap" })
