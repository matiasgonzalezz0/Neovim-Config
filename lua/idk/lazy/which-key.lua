return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		spec = {
			{ "<leader>a", group = "AI (avante)" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Hunk" },
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Tabs" },
		},
	},
}
