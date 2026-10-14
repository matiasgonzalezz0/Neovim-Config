return {
	"esmuellert/codediff.nvim",
	cmd = "CodeDiff",
	keys = {
		{ "<leader>gd", "<CMD>CodeDiff<CR>", desc = "Git: Diff working tree (all files)" },
		{
			"<leader>gD",
			function()
				-- One rev: show what that commit changed (rev^ vs rev). Two revs: pass through as-is.
				vim.ui.input({ prompt = "Commit (or rev1 rev2): " }, function(input)
					if not input or vim.trim(input) == "" then
						return
					end
					input = vim.trim(input)
					if input:find("%s") then
						vim.cmd("CodeDiff " .. input)
					else
						vim.cmd("CodeDiff " .. input .. "^ " .. input)
					end
				end)
			end,
			desc = "Git: Diff a specific commit",
		},
		{ "<leader>gl", "<CMD>CodeDiff HEAD~1 HEAD<CR>", desc = "Git: Diff last commit" },
		{ "<leader>gh", "<CMD>CodeDiff history<CR>", desc = "Git: Commit history" },
		{ "<leader>gf", "<CMD>CodeDiff history %<CR>", desc = "Git: File history" },
		{ "<leader>gh", ":CodeDiff history<CR>", mode = "v", desc = "Git: History of selected lines" },
	},
	-- Inside the diff tab: ]c/[c hunks, ]f/[f files, t toggles inline/side-by-side,
	-- gc folds unchanged code, - stages file, q quits, g? shows all keys
	opts = {
		history = { position = "left" },
	},
}
