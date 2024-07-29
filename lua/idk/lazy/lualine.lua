return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		icons_enabled = true,
		theme = "auto",
	},
	config = function()
		require("lualine").setup({
			sections = {
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
			},
		})
	end,
}
