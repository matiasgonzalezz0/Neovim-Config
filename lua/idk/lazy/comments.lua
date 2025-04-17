return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({})

		vim.keymap.set("n", "<leader>st", "<CMD>TodoTelescope<CR>", { desc = "Search TODOs with Telescope" })
	end,
}
