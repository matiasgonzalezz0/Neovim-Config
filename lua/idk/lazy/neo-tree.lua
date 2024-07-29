return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				filtered_items = {
					visible = true,
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				hijack_netrw_behavior = "open_current",
			},
		})

		vim.keymap.set("n", "<leader>nt", "<cmd>Neotree toggle<CR>")
	end,
}
