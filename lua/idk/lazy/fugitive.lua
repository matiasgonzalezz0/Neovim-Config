return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", "<CMD>Git<CR>", { desc = "Git: Status (fugitive)" })
		-- In the blame window: <CR> opens the commit, ~ / P reblame at parent, g? for help
		vim.keymap.set("n", "<leader>gb", "<CMD>Git blame<CR>", { desc = "Git: Blame whole file" })
	end,
}
