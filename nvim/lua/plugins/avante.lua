return {
	"yetone/avante.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = { file_types = { "markdown", "Avante" } },
			ft = { "markdown", "Avante" },
		},
	},
	build = "make",
	opts = {
		-- add any opts here
		-- for example
		provider = "copilot",
		copilot = {
			model = "claude-3.7-sonnet-thought",
			--			model = "claude-3.7-sonnet",
			temperature = 1,
			max_tokens = 20000,
		},
	},
}
