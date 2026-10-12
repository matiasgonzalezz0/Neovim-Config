return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				lua = { "stylua" },
				python = { "black" },
				go = { "gofumpt" },
				sql = { "sqruff" },
			},
			formatters = {
				sqruff = {
					prepend_args = { "--dialect", "sqlite" },
					-- 1 only means it left lint warnings it can't auto-fix
					exit_codes = { 0, 1 },
				},
			},
			format_on_save = function(bufnr)
				-- off unless enabled with :FormatEnable / :FormatToggle
				-- a buffer-local setting (from the ! variants) wins over the global one
				local enabled = vim.b[bufnr].autoformat
				if enabled == nil then
					enabled = vim.g.autoformat
				end
				if not enabled then
					return
				end
				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 2000,
				}
			end,
		})

		-- add ! to only affect the current buffer, e.g. :FormatEnable!
		local function set_autoformat(value, bang)
			if bang then
				vim.b.autoformat = value
			else
				vim.g.autoformat = value
			end
			local scope = bang and "buffer" or "global"
			vim.notify(("Format on save (%s): %s"):format(scope, value and "on" or "off"))
		end

		vim.api.nvim_create_user_command("FormatEnable", function(args)
			set_autoformat(true, args.bang)
		end, { bang = true, desc = "Enable format on save" })

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			set_autoformat(false, args.bang)
		end, { bang = true, desc = "Disable format on save" })

		vim.api.nvim_create_user_command("FormatToggle", function(args)
			local current = vim.g.autoformat
			if args.bang and vim.b.autoformat ~= nil then
				current = vim.b.autoformat
			end
			set_autoformat(not current, args.bang)
		end, { bang = true, desc = "Toggle format on save" })

		vim.keymap.set({ "n", "v" }, "<leader>ep", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
