return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 		})
	--
	-- 		vim.cmd.colorscheme("tokyonight")
	-- 	end,
	-- },
	{
		"catppuccin/nvim",
		name = "frappe",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			variant = "main",
	-- 			styles = {
	-- 				italic = false,
	-- 			},
	-- 		})
	--
	-- 		vim.cmd.colorscheme("rose-pine")
	-- 	end,
	-- },
}
