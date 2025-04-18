return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_enabled = false

		vim.keymap.set("i", "<C-k>", "<Plug>(copilot-suggest)", { silent = true })
		vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', {
			expr = true,
			replace_keycodes = false,
		})

		vim.g.copilot_no_tab_map = true
	end,
}
