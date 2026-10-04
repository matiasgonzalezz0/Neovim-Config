return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		current_line_blame = true,
		current_line_blame_opts = { delay = 300 },
		on_attach = function(bufnr)
			local gs = require("gitsigns")
			local function map(mode, keys, func, desc)
				vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "Git: " .. desc })
			end

			-- Hunk navigation (falls back to native ]c/[c in diff mode)
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gs.nav_hunk("next")
				end
			end, "Next hunk")
			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gs.nav_hunk("prev")
				end
			end, "Previous hunk")

			-- Hunk actions
			map("n", "<leader>hp", gs.preview_hunk_inline, "Preview hunk inline")
			map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset selected lines")
			map("n", "<leader>hq", function()
				gs.setqflist("all")
			end, "All hunks to quickfix")

			-- Blame
			map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle inline blame")
			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, "Blame line (full commit)")

			-- Highlight changes inside the normal buffer (full-file context)
			map("n", "<leader>gi", function()
				gs.toggle_linehl()
				gs.toggle_word_diff()
			end, "Toggle inline change highlight")
		end,
	},
}
