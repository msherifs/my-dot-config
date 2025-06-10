return {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	priority = 1000, -- load before other plugins
	opts = {
		library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
		sources = {
			-- add lazydev to your completion providers
			default = { "lazydev" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100, -- show at a higher priority than lsp
				},
			},
		},
	},
}
