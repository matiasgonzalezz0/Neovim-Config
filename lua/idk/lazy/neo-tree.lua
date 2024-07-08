return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim"
	},
    keys = {
		{ "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
		require("neo-tree").setup()
    end,
}
