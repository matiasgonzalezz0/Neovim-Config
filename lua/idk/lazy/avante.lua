return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	opts = {
		provider = "openai",
		openai = {
			endpoint = "https://api.openai.com/v1",
			model = "gpt-4o",
			timeout = 30000,
			temperature = 0,
			max_completion_tokens = 8192,
		},
	},
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-tree/nvim-web-devicons",
		"zbirenbaum/copilot.lua",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = true,
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
	config = function()
		require("avante").setup({})

		vim.keymap.set("n", "<leader>an", "<CMD>AvanteChatNew<CR>", { desc = "Open new Avante chat" })
	end,
}
