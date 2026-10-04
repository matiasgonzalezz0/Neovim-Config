return {
	"avante-corp/avante.nvim",
	event = "VeryLazy",
	version = false,
	build = "make",
	opts = {
		-- Claude Code via ACP (uses your Claude subscription).
		-- REQUIRED to use Claude Code: install the ACP adapter once (needs the `claude` CLI too):
		--   npm i -g @agentclientprotocol/claude-agent-acp
		-- Switch at runtime with :AvanteSwitchProvider (openai / openrouter read
		-- OPENAI_API_KEY / OPENROUTER_API_KEY from the environment).
		provider = "claude-code",
		acp_providers = {
			["claude-code"] = {
				env = {
					-- Default is "bypassPermissions"; ask before edits/commands instead
					ACP_PERMISSION_MODE = "default",
				},
			},
		},
		selector = { provider = "telescope" },
	},
	config = function(_, opts)
		require("avante").setup(opts)

		-- Avante's model picker crashes on ACP providers (claude-code), which have their own picker
		vim.keymap.set("n", "<leader>a?", function()
			local Config = require("avante.config")
			if Config.acp_providers[Config.provider] then
				require("avante.api").select_acp_model()
			else
				require("avante.api").select_model()
			end
		end, { desc = "avante: select model" })
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{ "ColinKennedy/mega.cmdparse", dependencies = { "ColinKennedy/mega.logging" } },
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-tree/nvim-web-devicons",
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
}
